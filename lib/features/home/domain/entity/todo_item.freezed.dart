// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Subtask {

 String get id; String get title; bool get isCompleted;
/// Create a copy of Subtask
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubtaskCopyWith<Subtask> get copyWith => _$SubtaskCopyWithImpl<Subtask>(this as Subtask, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Subtask&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,isCompleted);

@override
String toString() {
  return 'Subtask(id: $id, title: $title, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $SubtaskCopyWith<$Res>  {
  factory $SubtaskCopyWith(Subtask value, $Res Function(Subtask) _then) = _$SubtaskCopyWithImpl;
@useResult
$Res call({
 String id, String title, bool isCompleted
});




}
/// @nodoc
class _$SubtaskCopyWithImpl<$Res>
    implements $SubtaskCopyWith<$Res> {
  _$SubtaskCopyWithImpl(this._self, this._then);

  final Subtask _self;
  final $Res Function(Subtask) _then;

/// Create a copy of Subtask
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? isCompleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Subtask].
extension SubtaskPatterns on Subtask {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Subtask value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Subtask() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Subtask value)  $default,){
final _that = this;
switch (_that) {
case _Subtask():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Subtask value)?  $default,){
final _that = this;
switch (_that) {
case _Subtask() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  bool isCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Subtask() when $default != null:
return $default(_that.id,_that.title,_that.isCompleted);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  bool isCompleted)  $default,) {final _that = this;
switch (_that) {
case _Subtask():
return $default(_that.id,_that.title,_that.isCompleted);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  bool isCompleted)?  $default,) {final _that = this;
switch (_that) {
case _Subtask() when $default != null:
return $default(_that.id,_that.title,_that.isCompleted);case _:
  return null;

}
}

}

/// @nodoc


class _Subtask extends Subtask {
  const _Subtask({required this.id, required this.title, this.isCompleted = false}): super._();
  

@override final  String id;
@override final  String title;
@override@JsonKey() final  bool isCompleted;

/// Create a copy of Subtask
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubtaskCopyWith<_Subtask> get copyWith => __$SubtaskCopyWithImpl<_Subtask>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Subtask&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,isCompleted);

@override
String toString() {
  return 'Subtask(id: $id, title: $title, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class _$SubtaskCopyWith<$Res> implements $SubtaskCopyWith<$Res> {
  factory _$SubtaskCopyWith(_Subtask value, $Res Function(_Subtask) _then) = __$SubtaskCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, bool isCompleted
});




}
/// @nodoc
class __$SubtaskCopyWithImpl<$Res>
    implements _$SubtaskCopyWith<$Res> {
  __$SubtaskCopyWithImpl(this._self, this._then);

  final _Subtask _self;
  final $Res Function(_Subtask) _then;

/// Create a copy of Subtask
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? isCompleted = null,}) {
  return _then(_Subtask(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$TodoItem {

 String get id; String get title; String get description; bool get isCompleted; TodoPriority get priority; DateTime? get dueDate; List<String> get categories; List<Subtask> get subtasks; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of TodoItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoItemCopyWith<TodoItem> get copyWith => _$TodoItemCopyWithImpl<TodoItem>(this as TodoItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.subtasks, subtasks)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,isCompleted,priority,dueDate,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(subtasks),createdAt,updatedAt);

@override
String toString() {
  return 'TodoItem(id: $id, title: $title, description: $description, isCompleted: $isCompleted, priority: $priority, dueDate: $dueDate, categories: $categories, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $TodoItemCopyWith<$Res>  {
  factory $TodoItemCopyWith(TodoItem value, $Res Function(TodoItem) _then) = _$TodoItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, bool isCompleted, TodoPriority priority, DateTime? dueDate, List<String> categories, List<Subtask> subtasks, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$TodoItemCopyWithImpl<$Res>
    implements $TodoItemCopyWith<$Res> {
  _$TodoItemCopyWithImpl(this._self, this._then);

  final TodoItem _self;
  final $Res Function(TodoItem) _then;

/// Create a copy of TodoItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? isCompleted = null,Object? priority = null,Object? dueDate = freezed,Object? categories = null,Object? subtasks = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TodoPriority,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,subtasks: null == subtasks ? _self.subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<Subtask>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoItem].
extension TodoItemPatterns on TodoItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoItem value)  $default,){
final _that = this;
switch (_that) {
case _TodoItem():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoItem value)?  $default,){
final _that = this;
switch (_that) {
case _TodoItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  bool isCompleted,  TodoPriority priority,  DateTime? dueDate,  List<String> categories,  List<Subtask> subtasks,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoItem() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isCompleted,_that.priority,_that.dueDate,_that.categories,_that.subtasks,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  bool isCompleted,  TodoPriority priority,  DateTime? dueDate,  List<String> categories,  List<Subtask> subtasks,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _TodoItem():
return $default(_that.id,_that.title,_that.description,_that.isCompleted,_that.priority,_that.dueDate,_that.categories,_that.subtasks,_that.createdAt,_that.updatedAt);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  bool isCompleted,  TodoPriority priority,  DateTime? dueDate,  List<String> categories,  List<Subtask> subtasks,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _TodoItem() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.isCompleted,_that.priority,_that.dueDate,_that.categories,_that.subtasks,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TodoItem extends TodoItem {
  const _TodoItem({required this.id, required this.title, this.description = '', this.isCompleted = false, this.priority = TodoPriority.medium, this.dueDate, final  List<String> categories = const <String>[], final  List<Subtask> subtasks = const <Subtask>[], this.createdAt, this.updatedAt}): _categories = categories,_subtasks = subtasks,super._();
  

@override final  String id;
@override final  String title;
@override@JsonKey() final  String description;
@override@JsonKey() final  bool isCompleted;
@override@JsonKey() final  TodoPriority priority;
@override final  DateTime? dueDate;
 final  List<String> _categories;
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<Subtask> _subtasks;
@override@JsonKey() List<Subtask> get subtasks {
  if (_subtasks is EqualUnmodifiableListView) return _subtasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtasks);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of TodoItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoItemCopyWith<_TodoItem> get copyWith => __$TodoItemCopyWithImpl<_TodoItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._subtasks, _subtasks)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,description,isCompleted,priority,dueDate,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_subtasks),createdAt,updatedAt);

@override
String toString() {
  return 'TodoItem(id: $id, title: $title, description: $description, isCompleted: $isCompleted, priority: $priority, dueDate: $dueDate, categories: $categories, subtasks: $subtasks, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$TodoItemCopyWith<$Res> implements $TodoItemCopyWith<$Res> {
  factory _$TodoItemCopyWith(_TodoItem value, $Res Function(_TodoItem) _then) = __$TodoItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, bool isCompleted, TodoPriority priority, DateTime? dueDate, List<String> categories, List<Subtask> subtasks, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$TodoItemCopyWithImpl<$Res>
    implements _$TodoItemCopyWith<$Res> {
  __$TodoItemCopyWithImpl(this._self, this._then);

  final _TodoItem _self;
  final $Res Function(_TodoItem) _then;

/// Create a copy of TodoItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? isCompleted = null,Object? priority = null,Object? dueDate = freezed,Object? categories = null,Object? subtasks = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_TodoItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TodoPriority,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,subtasks: null == subtasks ? _self._subtasks : subtasks // ignore: cast_nullable_to_non_nullable
as List<Subtask>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
