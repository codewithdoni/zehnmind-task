import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zehnmind/core/error/app_exception.dart';
import 'package:zehnmind/features/home/domain/entity/todo_item.dart';
import 'package:zehnmind/features/home/domain/repository/base_todo_repository.dart';

part 'todo_event.dart';
part 'todo_state.dart';
part 'todo_bloc.freezed.dart';

@injectable
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this._repo) : super(const TodoState()) {
    on<TodoEventStartWatching>(_onStartWatching);
    on<TodoEventAdd>(_onAdd);
    on<TodoEventUpdate>(_onUpdate);
    on<TodoEventToggle>(_onToggle);
    on<TodoEventDelete>(_onDelete);
  }

  final BaseTodoRepository _repo;

  Future<void> _onStartWatching(
    TodoEventStartWatching e,
    Emitter<TodoState> emit,
  ) async {
    emit(state.copyWith(status: TodoStatus.loading));
    await emit.forEach<List<TodoItem>>(
      _repo.watchTodos(),
      onData: (todos) =>
          state.copyWith(status: TodoStatus.success, todos: todos),
      onError: (error, _) {
        final mapped = AppException.from(error);
        return state.copyWith(status: TodoStatus.error, error: mapped);
      },
    );
  }

  Future<void> _onAdd(TodoEventAdd e, Emitter<TodoState> emit) async {
    try {
      await _repo.addTodo(
        title: e.title,
        description: e.description,
        priority: e.priority,
        dueDate: e.dueDate,
        categories: e.categories,
      );
    } on AppException catch (err) {
      emit(state.copyWith(error: err));
    }
  }

  Future<void> _onUpdate(TodoEventUpdate e, Emitter<TodoState> emit) async {
    try {
      await _repo.updateTodo(e.todo);
    } on AppException catch (err) {
      emit(state.copyWith(error: err));
    }
  }

  Future<void> _onToggle(TodoEventToggle e, Emitter<TodoState> emit) async {
    try {
      await _repo.toggle(id: e.id, isCompleted: e.isCompleted);
    } on AppException catch (err) {
      emit(state.copyWith(error: err));
    }
  }

  Future<void> _onDelete(TodoEventDelete e, Emitter<TodoState> emit) async {
    try {
      await _repo.deleteTodo(e.id);
    } on AppException catch (err) {
      emit(state.copyWith(error: err));
    }
  }
}
