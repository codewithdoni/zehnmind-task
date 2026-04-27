import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:zehnmind/core/error/app_exception.dart';
import 'package:zehnmind/features/home/domain/entity/todo_item.dart';

@lazySingleton
class TodoFirestoreSource {
  TodoFirestoreSource(this._firestore, this._auth);

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  CollectionReference<Map<String, dynamic>> _todosRef() {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw const UnauthorizedException();
    return _firestore.collection('users').doc(uid).collection('todos');
  }

  Stream<List<TodoItem>> watchTodos() {
    return _todosRef()
        .orderBy('created_at', descending: true)
        .snapshots()
        .map((snap) => snap.docs.map(TodoItem.fromFirestore).toList());
  }

  Future<void> addTodo({required String title, String? description}) async {
    await _todosRef().add({
      'title': title,
      'description': description ?? '',
      'is_completed': false,
      'created_at': FieldValue.serverTimestamp(),
      'updated_at': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateTodo(TodoItem todo) async {
    await _todosRef().doc(todo.id).update(todo.toFirestore());
  }

  Future<void> toggle({required String id, required bool isCompleted}) async {
    await _todosRef().doc(id).update({
      'is_completed': isCompleted,
      'updated_at': FieldValue.serverTimestamp(),
    });
  }

  Future<void> deleteTodo(String id) async {
    await _todosRef().doc(id).delete();
  }
}
