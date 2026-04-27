import 'package:zehnmind/features/home/domain/entity/todo_item.dart';

abstract interface class BaseTodoRepository {
  Stream<List<TodoItem>> watchTodos();
  Future<void> addTodo({
    required String title,
    String? description,
    TodoPriority priority,
    DateTime? dueDate,
    List<String> categories,
  });
  Future<void> updateTodo(TodoItem todo);
  Future<void> toggle({required String id, required bool isCompleted});
  Future<void> deleteTodo(String id);
}
