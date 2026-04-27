import 'package:injectable/injectable.dart';
import 'package:zehnmind/core/safe_execution/safe_execution_manager.dart';
import 'package:zehnmind/features/home/data/data_source/todo_firestore_source.dart';
import 'package:zehnmind/features/home/domain/entity/todo_item.dart';
import 'package:zehnmind/features/home/domain/repository/base_todo_repository.dart';

@LazySingleton(as: BaseTodoRepository)
class TodoRepository implements BaseTodoRepository {
  TodoRepository(this._source, this._safe);

  final TodoFirestoreSource _source;
  final SafeExecutionManager _safe;

  @override
  Stream<List<TodoItem>> watchTodos() => _source.watchTodos();

  @override
  Future<void> addTodo({required String title, String? description}) =>
      _safe.run(() => _source.addTodo(title: title, description: description));

  @override
  Future<void> updateTodo(TodoItem todo) =>
      _safe.run(() => _source.updateTodo(todo));

  @override
  Future<void> toggle({required String id, required bool isCompleted}) =>
      _safe.run(() => _source.toggle(id: id, isCompleted: isCompleted));

  @override
  Future<void> deleteTodo(String id) => _safe.run(() => _source.deleteTodo(id));
}
