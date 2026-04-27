import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_item.freezed.dart';

enum TodoPriority { low, medium, high }

extension TodoPriorityX on TodoPriority {
  String get label => switch (this) {
    TodoPriority.low => 'Low',
    TodoPriority.medium => 'Medium',
    TodoPriority.high => 'High',
  };

  static TodoPriority parse(String? raw) => switch (raw) {
    'high' => TodoPriority.high,
    'low' => TodoPriority.low,
    _ => TodoPriority.medium,
  };
}

@freezed
sealed class Subtask with _$Subtask {
  const factory Subtask({
    required String id,
    required String title,
    @Default(false) bool isCompleted,
  }) = _Subtask;

  const Subtask._();

  factory Subtask.fromMap(Map<String, dynamic> map) => Subtask(
    id: map['id'] as String? ?? '',
    title: map['title'] as String? ?? '',
    isCompleted: map['is_completed'] as bool? ?? false,
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'is_completed': isCompleted,
  };
}

@freezed
sealed class TodoItem with _$TodoItem {
  const factory TodoItem({
    required String id,
    required String title,
    @Default('') String description,
    @Default(false) bool isCompleted,
    @Default(TodoPriority.medium) TodoPriority priority,
    DateTime? dueDate,
    @Default(<String>[]) List<String> categories,
    @Default(<Subtask>[]) List<Subtask> subtasks,
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
      priority: TodoPriorityX.parse(data['priority'] as String?),
      dueDate: (data['due_date'] as Timestamp?)?.toDate(),
      categories: ((data['categories'] as List?) ?? const [])
          .whereType<String>()
          .toList(),
      subtasks: ((data['subtasks'] as List?) ?? const [])
          .whereType<Map<String, dynamic>>()
          .map(Subtask.fromMap)
          .toList(),
      createdAt: (data['created_at'] as Timestamp?)?.toDate(),
      updatedAt: (data['updated_at'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() => {
    'title': title,
    'description': description,
    'is_completed': isCompleted,
    'priority': priority.name,
    'due_date': dueDate == null ? null : Timestamp.fromDate(dueDate!),
    'categories': categories,
    'subtasks': subtasks.map((s) => s.toMap()).toList(),
    'updated_at': FieldValue.serverTimestamp(),
  };

  bool get isOverdue =>
      dueDate != null &&
      !isCompleted &&
      dueDate!.isBefore(DateTime.now());

  int get completedSubtaskCount =>
      subtasks.where((s) => s.isCompleted).length;
}
