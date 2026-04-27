part of 'todo_bloc.dart';

enum TodoStatus { initial, loading, success, error }

@freezed
sealed class TodoState with _$TodoState {
  const factory TodoState({
    @Default(TodoStatus.initial) TodoStatus status,
    @Default(<TodoItem>[]) List<TodoItem> todos,
    AppException? error,
  }) = _TodoState;

  const TodoState._();

  int get completedCount => todos.where((t) => t.isCompleted).length;
  int get pendingCount => todos.where((t) => !t.isCompleted).length;
  bool get isEmpty => status == TodoStatus.success && todos.isEmpty;
}
