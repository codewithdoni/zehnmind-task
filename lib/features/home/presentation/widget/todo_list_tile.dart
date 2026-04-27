import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zehnmind/core/theme/app_colors.dart';
import 'package:zehnmind/features/home/domain/entity/todo_item.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
    required this.onEdit,
  });

  final TodoItem todo;
  final ValueChanged<bool> onToggle;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  Color _priorityColor(TodoPriority priority) => switch (priority) {
    TodoPriority.high => AppColors.error,
    TodoPriority.medium => AppColors.warning,
    TodoPriority.low => AppColors.success,
  };

  @override
  Widget build(BuildContext context) {
    final hasMeta =
        todo.dueDate != null ||
        todo.categories.isNotEmpty ||
        todo.subtasks.isNotEmpty;

    return Dismissible(
      key: ValueKey(todo.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 24),
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
          color: AppColors.error,
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.delete_outline, color: Colors.white),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 6, 8, hasMeta ? 10 : 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: todo.isCompleted,
                    onChanged: (v) => onToggle(v ?? false),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  Container(
                    width: 4,
                    height: 24,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: _priorityColor(todo.priority),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          todo.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: todo.isCompleted
                                ? AppColors.textMuted
                                : AppColors.textPrimary,
                            decoration: todo.isCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        if (todo.description.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: Text(
                              todo.description,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 13,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, size: 20),
                    color: AppColors.textSecondary,
                    onPressed: onEdit,
                  ),
                ],
              ),
              if (hasMeta)
                Padding(
                  padding: const EdgeInsets.only(left: 60, top: 4),
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      if (todo.dueDate != null)
                        _MetaChip(
                          icon: Icons.event_outlined,
                          label: DateFormat.MMMd().format(todo.dueDate!),
                          color: todo.isOverdue
                              ? AppColors.error
                              : AppColors.textSecondary,
                          background: todo.isOverdue
                              ? AppColors.error.withValues(alpha: 0.1)
                              : AppColors.surfaceVariant,
                        ),
                      if (todo.subtasks.isNotEmpty)
                        _MetaChip(
                          icon: Icons.checklist_rounded,
                          label:
                              '${todo.completedSubtaskCount}/${todo.subtasks.length}',
                          color: AppColors.textSecondary,
                          background: AppColors.surfaceVariant,
                        ),
                      ...todo.categories.map(
                        (c) => _MetaChip(
                          icon: Icons.label_outline,
                          label: c,
                          color: AppColors.primary,
                          background: AppColors.primary.withValues(alpha: 0.1),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({
    required this.icon,
    required this.label,
    required this.color,
    required this.background,
  });

  final IconData icon;
  final String label;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
