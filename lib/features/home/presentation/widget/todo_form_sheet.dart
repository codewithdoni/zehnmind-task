import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zehnmind/config/di/get_it.dart';
import 'package:zehnmind/core/extensions/context_extensions.dart';
import 'package:zehnmind/core/i18n/translations.g.dart';
import 'package:zehnmind/core/services/ai_service.dart';
import 'package:zehnmind/core/theme/app_colors.dart';
import 'package:zehnmind/core/widgets/app_button.dart';
import 'package:zehnmind/core/widgets/app_text_field.dart';
import 'package:zehnmind/features/home/domain/entity/todo_item.dart';

class TodoFormResult {
  TodoFormResult({
    required this.title,
    required this.description,
    required this.priority,
    required this.dueDate,
    required this.categories,
    required this.subtasks,
  });

  final String title;
  final String? description;
  final TodoPriority priority;
  final DateTime? dueDate;
  final List<String> categories;
  final List<Subtask> subtasks;
}

class TodoFormSheet extends StatefulWidget {
  const TodoFormSheet({
    super.key,
    this.initial,
    required this.onSubmit,
  });

  final TodoItem? initial;
  final ValueChanged<TodoFormResult> onSubmit;

  @override
  State<TodoFormSheet> createState() => _TodoFormSheetState();
}

class _TodoFormSheetState extends State<TodoFormSheet> {
  late final _titleC = TextEditingController(text: widget.initial?.title);
  late final _descC =
      TextEditingController(text: widget.initial?.description);
  late TodoPriority _priority =
      widget.initial?.priority ?? TodoPriority.medium;
  late DateTime? _dueDate = widget.initial?.dueDate;
  late List<String> _categories =
      List<String>.from(widget.initial?.categories ?? const []);
  late List<Subtask> _subtasks =
      List<Subtask>.from(widget.initial?.subtasks ?? const []);

  static const _categoryOptions = ['Work', 'Personal', 'Urgent', 'Ideas'];

  bool _aiLoading = false;

  bool get _isEdit => widget.initial != null;

  Future<void> _aiSuggest() async {
    final title = _titleC.text.trim();
    if (title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Enter a title first')),
      );
      return;
    }
    setState(() => _aiLoading = true);
    try {
      final suggestion = await getIt<AiService>().categorize(
        title: title,
        description: _descC.text.trim().isEmpty ? null : _descC.text.trim(),
      );
      if (!mounted) return;
      setState(() {
        _priority = suggestion.priority;
        // Merge suggested categories with existing ones (no duplicates).
        final merged = {..._categories, ...suggestion.categories}.toList();
        _categories = merged;
      });
    } finally {
      if (mounted) setState(() => _aiLoading = false);
    }
  }

  @override
  void dispose() {
    _titleC.dispose();
    _descC.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? now,
      firstDate: now.subtract(const Duration(days: 1)),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) setState(() => _dueDate = picked);
  }

  void _addSubtask() {
    setState(() {
      _subtasks = [
        ..._subtasks,
        Subtask(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          title: '',
        ),
      ];
    });
  }

  void _toggleCategory(String c) {
    setState(() {
      if (_categories.contains(c)) {
        _categories = _categories.where((x) => x != c).toList();
      } else {
        _categories = [..._categories, c];
      }
    });
  }

  void _save() {
    final title = _titleC.text.trim();
    if (title.isEmpty) return;
    final cleanSubtasks = _subtasks
        .where((s) => s.title.trim().isNotEmpty)
        .map(
          (s) => s.copyWith(title: s.title.trim()),
        )
        .toList();
    widget.onSubmit(
      TodoFormResult(
        title: title,
        description: _descC.text.trim().isEmpty ? null : _descC.text.trim(),
        priority: _priority,
        dueDate: _dueDate,
        categories: _categories,
        subtasks: cleanSubtasks,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        20,
        20,
        20,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _isEdit ? t.home.edit_task : t.home.add_task,
                    style: context.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: _aiLoading ? null : _aiSuggest,
                  icon: _aiLoading
                      ? const SizedBox(
                          height: 14,
                          width: 14,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.auto_awesome, size: 16),
                  label: const Text('AI Suggest'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            AppTextField(controller: _titleC, hint: t.home.task_title),
            const SizedBox(height: 12),
            AppTextField(
              controller: _descC,
              hint: t.home.task_description,
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            _SectionLabel('Priority'),
            const SizedBox(height: 8),
            SegmentedButton<TodoPriority>(
              segments: const [
                ButtonSegment(
                  value: TodoPriority.low,
                  label: Text('Low'),
                  icon: Icon(Icons.flag_outlined, size: 16),
                ),
                ButtonSegment(
                  value: TodoPriority.medium,
                  label: Text('Med'),
                  icon: Icon(Icons.flag, size: 16),
                ),
                ButtonSegment(
                  value: TodoPriority.high,
                  label: Text('High'),
                  icon: Icon(Icons.priority_high, size: 16),
                ),
              ],
              selected: {_priority},
              onSelectionChanged: (s) =>
                  setState(() => _priority = s.first),
            ),
            const SizedBox(height: 16),
            _SectionLabel('Due date'),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _pickDate,
                    icon: const Icon(Icons.event_outlined, size: 18),
                    label: Text(
                      _dueDate == null
                          ? 'Select date'
                          : DateFormat.yMMMMd().format(_dueDate!),
                    ),
                  ),
                ),
                if (_dueDate != null) ...[
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => setState(() => _dueDate = null),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            _SectionLabel('Categories'),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _categoryOptions.map((c) {
                final selected = _categories.contains(c);
                return FilterChip(
                  label: Text(c),
                  selected: selected,
                  onSelected: (_) => _toggleCategory(c),
                  selectedColor: AppColors.primary.withValues(alpha: 0.15),
                  checkmarkColor: AppColors.primary,
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _SectionLabel('Subtasks'),
                TextButton.icon(
                  onPressed: _addSubtask,
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Add'),
                ),
              ],
            ),
            ..._subtasks.asMap().entries.map((entry) {
              final i = entry.key;
              final sub = entry.value;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Checkbox(
                      value: sub.isCompleted,
                      onChanged: (v) {
                        setState(() {
                          _subtasks = [..._subtasks];
                          _subtasks[i] = sub.copyWith(isCompleted: v ?? false);
                        });
                      },
                    ),
                    Expanded(
                      child: TextField(
                        controller: TextEditingController(text: sub.title),
                        decoration: const InputDecoration(
                          hintText: 'Subtask…',
                          isDense: true,
                        ),
                        onChanged: (v) {
                          _subtasks[i] = sub.copyWith(title: v);
                        },
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      color: AppColors.textSecondary,
                      onPressed: () {
                        setState(() {
                          _subtasks = [..._subtasks]..removeAt(i);
                        });
                      },
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 16),
            AppPrimaryButton(
              label: _isEdit ? t.common.save : t.home.add,
              onPressed: _save,
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.textSecondary,
        fontSize: 13,
      ),
    );
  }
}
