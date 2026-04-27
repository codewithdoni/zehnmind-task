import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zehnmind/core/extensions/context_extensions.dart';
import 'package:zehnmind/core/i18n/translations.g.dart';
import 'package:zehnmind/core/theme/app_colors.dart';
import 'package:zehnmind/features/home/domain/entity/todo_item.dart';
import 'package:zehnmind/features/home/presentation/bloc/todo_bloc.dart';
import 'package:zehnmind/features/home/presentation/widget/todo_form_sheet.dart';
import 'package:zehnmind/features/home/presentation/widget/todo_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          t.home.title,
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state.todos.isEmpty) return const SizedBox.shrink();
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      t.home.completed_count
                          .replaceAll('{done}', state.completedCount.toString())
                          .replaceAll('{total}', state.todos.length.toString()),
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.status == TodoStatus.loading && state.todos.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.checklist_rtl_rounded,
                      size: 80,
                      color: AppColors.primary.withValues(alpha: 0.5),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      t.home.empty,
                      textAlign: TextAlign.center,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: state.todos.length,
            itemBuilder: (_, i) {
              final todo = state.todos[i];
              return TodoListTile(
                todo: todo,
                onToggle: (v) => context.read<TodoBloc>().add(
                  TodoEvent.toggle(id: todo.id, isCompleted: v),
                ),
                onDelete: () =>
                    context.read<TodoBloc>().add(TodoEvent.delete(todo.id)),
                onEdit: () => _showEditSheet(context, todo),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddSheet(context),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _showAddSheet(BuildContext context) {
    final bloc = context.read<TodoBloc>();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetCtx) => TodoFormSheet(
        onSubmit: (title, desc) {
          bloc.add(TodoEvent.add(title: title, description: desc));
          Navigator.pop(sheetCtx);
        },
      ),
    );
  }

  void _showEditSheet(BuildContext context, TodoItem todo) {
    final bloc = context.read<TodoBloc>();
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (sheetCtx) => TodoFormSheet(
        initialTitle: todo.title,
        initialDescription: todo.description,
        onSubmit: (title, desc) {
          bloc.add(
            TodoEvent.update(
              todo.copyWith(title: title, description: desc ?? ''),
            ),
          );
          Navigator.pop(sheetCtx);
        },
      ),
    );
  }
}
