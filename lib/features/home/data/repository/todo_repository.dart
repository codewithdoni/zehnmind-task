import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:zehnmind/core/safe_execution/safe_execution_manager.dart';
import 'package:zehnmind/core/services/notification_service.dart';
import 'package:zehnmind/features/home/data/data_source/todo_firestore_source.dart';
import 'package:zehnmind/features/home/domain/entity/todo_item.dart';
import 'package:zehnmind/features/home/domain/repository/base_todo_repository.dart';

@LazySingleton(as: BaseTodoRepository)
class TodoRepository implements BaseTodoRepository {
  TodoRepository(this._source, this._safe, this._notifications, this._logger);

  final TodoFirestoreSource _source;
  final SafeExecutionManager _safe;
  final NotificationService _notifications;
  final Logger _logger;

  @override
  Stream<List<TodoItem>> watchTodos() => _source.watchTodos();

  @override
  Future<void> addTodo({
    required String title,
    String? description,
    TodoPriority priority = TodoPriority.medium,
    DateTime? dueDate,
    List<String> categories = const [],
  }) async {
    final id = await _safe.run(
      () => _source.addTodo(
        title: title,
        description: description,
        priority: priority,
        dueDate: dueDate,
        categories: categories,
      ),
    );
    if (dueDate != null) {
      _scheduleReminder(taskId: id, title: title, dueDate: dueDate);
    }
  }

  @override
  Future<void> updateTodo(TodoItem todo) async {
    await _safe.run(() => _source.updateTodo(todo));
    _cancelReminder(todo.id);
    if (todo.dueDate != null && !todo.isCompleted) {
      _scheduleReminder(
        taskId: todo.id,
        title: todo.title,
        dueDate: todo.dueDate!,
      );
    }
  }

  @override
  Future<void> toggle({required String id, required bool isCompleted}) async {
    await _safe.run(() => _source.toggle(id: id, isCompleted: isCompleted));
    if (isCompleted) {
      _cancelReminder(id);
    }
  }

  @override
  Future<void> deleteTodo(String id) async {
    _cancelReminder(id);
    await _safe.run(() => _source.deleteTodo(id));
  }

  /// Best-effort: a notification scheduling failure shouldn't break the
  /// Firestore write that already succeeded.
  void _scheduleReminder({
    required String taskId,
    required String title,
    required DateTime dueDate,
  }) {
    _notifications
        .scheduleTaskReminder(taskId: taskId, title: title, dueDate: dueDate)
        .catchError((Object e, StackTrace st) {
      _logger.w('Failed to schedule reminder for $taskId',
          error: e, stackTrace: st);
    });
  }

  void _cancelReminder(String taskId) {
    _notifications.cancelTaskReminder(taskId).catchError((Object e, StackTrace st) {
      _logger.w('Failed to cancel reminder for $taskId',
          error: e, stackTrace: st);
    });
  }
}
