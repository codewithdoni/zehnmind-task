import 'package:flutter/material.dart';
import 'package:zehnmind/core/extensions/context_extensions.dart';
import 'package:zehnmind/core/i18n/translations.g.dart';
import 'package:zehnmind/core/widgets/app_button.dart';
import 'package:zehnmind/core/widgets/app_text_field.dart';

class TodoFormSheet extends StatefulWidget {
  const TodoFormSheet({
    super.key,
    this.initialTitle,
    this.initialDescription,
    required this.onSubmit,
  });

  final String? initialTitle;
  final String? initialDescription;
  final void Function(String title, String? description) onSubmit;

  @override
  State<TodoFormSheet> createState() => _TodoFormSheetState();
}

class _TodoFormSheetState extends State<TodoFormSheet> {
  late final _titleC = TextEditingController(text: widget.initialTitle);
  late final _descC = TextEditingController(text: widget.initialDescription);

  bool get _isEdit => widget.initialTitle != null;

  @override
  void dispose() {
    _titleC.dispose();
    _descC.dispose();
    super.dispose();
  }

  void _save() {
    final title = _titleC.text.trim();
    if (title.isEmpty) return;
    final desc = _descC.text.trim();
    widget.onSubmit(title, desc.isEmpty ? null : desc);
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            _isEdit ? t.home.edit_task : t.home.add_task,
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          AppTextField(controller: _titleC, hint: t.home.task_title),
          const SizedBox(height: 12),
          AppTextField(
            controller: _descC,
            hint: t.home.task_description,
            maxLines: 3,
          ),
          const SizedBox(height: 20),
          AppPrimaryButton(
            label: _isEdit ? t.common.save : t.home.add,
            onPressed: _save,
          ),
        ],
      ),
    );
  }
}
