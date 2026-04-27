part of 'todo_bloc.dart';

@freezed
sealed class TodoEvent with _$TodoEvent {
  const factory TodoEvent.startWatching() = TodoEventStartWatching;
  const factory TodoEvent.add({required String title, String? description}) =
      TodoEventAdd;
  const factory TodoEvent.update(TodoItem todo) = TodoEventUpdate;
  const factory TodoEvent.toggle({
    required String id,
    required bool isCompleted,
  }) = TodoEventToggle;
  const factory TodoEvent.delete(String id) = TodoEventDelete;
}
