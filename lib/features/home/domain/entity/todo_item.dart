import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';

@freezed
sealed class TodoItem with _$TodoItem {
  const factory TodoItem({
    required String id,
    required String title,
    @Default('') String description,
    @Default(false) bool isCompleted,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _TodoItem;

  const TodoItem._();

  factory TodoItem.fromFirestore(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data() ?? <String, dynamic>{};
    return TodoItem(
      id: doc.id,
      title: data['title'] as String? ?? '',
      description: data['description'] as String? ?? '',
      isCompleted: data['is_completed'] as bool? ?? false,
      createdAt: (data['created_at'] as Timestamp?)?.toDate(),
      updatedAt: (data['updated_at'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() => {
    'title': title,
    'description': description,
    'is_completed': isCompleted,
    'updated_at': FieldValue.serverTimestamp(),
  };
}
