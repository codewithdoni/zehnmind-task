import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
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
        child: ListTile(
          leading: Checkbox(
            value: todo.isCompleted,
            onChanged: (v) => onToggle(v ?? false),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          title: Text(
            todo.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: todo.isCompleted
                  ? AppColors.textMuted
                  : AppColors.textPrimary,
              decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: todo.description.isNotEmpty
              ? Text(
                  todo.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: AppColors.textSecondary),
                )
              : null,
          trailing: IconButton(
            icon: const Icon(Icons.edit_outlined, size: 20),
            color: AppColors.textSecondary,
            onPressed: onEdit,
          ),
        ),
      ),
    );
  }
}
