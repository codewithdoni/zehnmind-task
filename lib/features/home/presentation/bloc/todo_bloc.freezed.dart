// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TodoEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoEvent()';
}


}

/// @nodoc
class $TodoEventCopyWith<$Res>  {
$TodoEventCopyWith(TodoEvent _, $Res Function(TodoEvent) __);
}


/// Adds pattern-matching-related methods to [TodoEvent].
extension TodoEventPatterns on TodoEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TodoEventStartWatching value)?  startWatching,TResult Function( TodoEventAdd value)?  add,TResult Function( TodoEventUpdate value)?  update,TResult Function( TodoEventToggle value)?  toggle,TResult Function( TodoEventDelete value)?  delete,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TodoEventStartWatching() when startWatching != null:
return startWatching(_that);case TodoEventAdd() when add != null:
return add(_that);case TodoEventUpdate() when update != null:
return update(_that);case TodoEventToggle() when toggle != null:
return toggle(_that);case TodoEventDelete() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TodoEventStartWatching value)  startWatching,required TResult Function( TodoEventAdd value)  add,required TResult Function( TodoEventUpdate value)  update,required TResult Function( TodoEventToggle value)  toggle,required TResult Function( TodoEventDelete value)  delete,}){
final _that = this;
switch (_that) {
case TodoEventStartWatching():
return startWatching(_that);case TodoEventAdd():
return add(_that);case TodoEventUpdate():
return update(_that);case TodoEventToggle():
return toggle(_that);case TodoEventDelete():
return delete(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TodoEventStartWatching value)?  startWatching,TResult? Function( TodoEventAdd value)?  add,TResult? Function( TodoEventUpdate value)?  update,TResult? Function( TodoEventToggle value)?  toggle,TResult? Function( TodoEventDelete value)?  delete,}){
final _that = this;
switch (_that) {
case TodoEventStartWatching() when startWatching != null:
return startWatching(_that);case TodoEventAdd() when add != null:
return add(_that);case TodoEventUpdate() when update != null:
return update(_that);case TodoEventToggle() when toggle != null:
return toggle(_that);case TodoEventDelete() when delete != null:
return delete(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  startWatching,TResult Function( String title,  String? description,  TodoPriority priority,  DateTime? dueDate,  List<String> categories)?  add,TResult Function( TodoItem todo)?  update,TResult Function( String id,  bool isCompleted)?  toggle,TResult Function( String id)?  delete,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TodoEventStartWatching() when startWatching != null:
return startWatching();case TodoEventAdd() when add != null:
return add(_that.title,_that.description,_that.priority,_that.dueDate,_that.categories);case TodoEventUpdate() when update != null:
return update(_that.todo);case TodoEventToggle() when toggle != null:
return toggle(_that.id,_that.isCompleted);case TodoEventDelete() when delete != null:
return delete(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  startWatching,required TResult Function( String title,  String? description,  TodoPriority priority,  DateTime? dueDate,  List<String> categories)  add,required TResult Function( TodoItem todo)  update,required TResult Function( String id,  bool isCompleted)  toggle,required TResult Function( String id)  delete,}) {final _that = this;
switch (_that) {
case TodoEventStartWatching():
return startWatching();case TodoEventAdd():
return add(_that.title,_that.description,_that.priority,_that.dueDate,_that.categories);case TodoEventUpdate():
return update(_that.todo);case TodoEventToggle():
return toggle(_that.id,_that.isCompleted);case TodoEventDelete():
return delete(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  startWatching,TResult? Function( String title,  String? description,  TodoPriority priority,  DateTime? dueDate,  List<String> categories)?  add,TResult? Function( TodoItem todo)?  update,TResult? Function( String id,  bool isCompleted)?  toggle,TResult? Function( String id)?  delete,}) {final _that = this;
switch (_that) {
case TodoEventStartWatching() when startWatching != null:
return startWatching();case TodoEventAdd() when add != null:
return add(_that.title,_that.description,_that.priority,_that.dueDate,_that.categories);case TodoEventUpdate() when update != null:
return update(_that.todo);case TodoEventToggle() when toggle != null:
return toggle(_that.id,_that.isCompleted);case TodoEventDelete() when delete != null:
return delete(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class TodoEventStartWatching implements TodoEvent {
  const TodoEventStartWatching();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoEventStartWatching);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TodoEvent.startWatching()';
}


}




/// @nodoc


class TodoEventAdd implements TodoEvent {
  const TodoEventAdd({required this.title, this.description, this.priority = TodoPriority.medium, this.dueDate, final  List<String> categories = const <String>[]}): _categories = categories;
  

 final  String title;
 final  String? description;
@JsonKey() final  TodoPriority priority;
 final  DateTime? dueDate;
 final  List<String> _categories;
@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoEventAddCopyWith<TodoEventAdd> get copyWith => _$TodoEventAddCopyWithImpl<TodoEventAdd>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoEventAdd&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,priority,dueDate,const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'TodoEvent.add(title: $title, description: $description, priority: $priority, dueDate: $dueDate, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $TodoEventAddCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory $TodoEventAddCopyWith(TodoEventAdd value, $Res Function(TodoEventAdd) _then) = _$TodoEventAddCopyWithImpl;
@useResult
$Res call({
 String title, String? description, TodoPriority priority, DateTime? dueDate, List<String> categories
});




}
/// @nodoc
class _$TodoEventAddCopyWithImpl<$Res>
    implements $TodoEventAddCopyWith<$Res> {
  _$TodoEventAddCopyWithImpl(this._self, this._then);

  final TodoEventAdd _self;
  final $Res Function(TodoEventAdd) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? priority = null,Object? dueDate = freezed,Object? categories = null,}) {
  return _then(TodoEventAdd(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as TodoPriority,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as DateTime?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class TodoEventUpdate implements TodoEvent {
  const TodoEventUpdate(this.todo);
  

 final  TodoItem todo;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoEventUpdateCopyWith<TodoEventUpdate> get copyWith => _$TodoEventUpdateCopyWithImpl<TodoEventUpdate>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoEventUpdate&&(identical(other.todo, todo) || other.todo == todo));
}


@override
int get hashCode => Object.hash(runtimeType,todo);

@override
String toString() {
  return 'TodoEvent.update(todo: $todo)';
}


}

/// @nodoc
abstract mixin class $TodoEventUpdateCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory $TodoEventUpdateCopyWith(TodoEventUpdate value, $Res Function(TodoEventUpdate) _then) = _$TodoEventUpdateCopyWithImpl;
@useResult
$Res call({
 TodoItem todo
});


$TodoItemCopyWith<$Res> get todo;

}
/// @nodoc
class _$TodoEventUpdateCopyWithImpl<$Res>
    implements $TodoEventUpdateCopyWith<$Res> {
  _$TodoEventUpdateCopyWithImpl(this._self, this._then);

  final TodoEventUpdate _self;
  final $Res Function(TodoEventUpdate) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? todo = null,}) {
  return _then(TodoEventUpdate(
null == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as TodoItem,
  ));
}

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodoItemCopyWith<$Res> get todo {
  
  return $TodoItemCopyWith<$Res>(_self.todo, (value) {
    return _then(_self.copyWith(todo: value));
  });
}
}

/// @nodoc


class TodoEventToggle implements TodoEvent {
  const TodoEventToggle({required this.id, required this.isCompleted});
  

 final  String id;
 final  bool isCompleted;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoEventToggleCopyWith<TodoEventToggle> get copyWith => _$TodoEventToggleCopyWithImpl<TodoEventToggle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoEventToggle&&(identical(other.id, id) || other.id == id)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted));
}


@override
int get hashCode => Object.hash(runtimeType,id,isCompleted);

@override
String toString() {
  return 'TodoEvent.toggle(id: $id, isCompleted: $isCompleted)';
}


}

/// @nodoc
abstract mixin class $TodoEventToggleCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory $TodoEventToggleCopyWith(TodoEventToggle value, $Res Function(TodoEventToggle) _then) = _$TodoEventToggleCopyWithImpl;
@useResult
$Res call({
 String id, bool isCompleted
});




}
/// @nodoc
class _$TodoEventToggleCopyWithImpl<$Res>
    implements $TodoEventToggleCopyWith<$Res> {
  _$TodoEventToggleCopyWithImpl(this._self, this._then);

  final TodoEventToggle _self;
  final $Res Function(TodoEventToggle) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,Object? isCompleted = null,}) {
  return _then(TodoEventToggle(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class TodoEventDelete implements TodoEvent {
  const TodoEventDelete(this.id);
  

 final  String id;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoEventDeleteCopyWith<TodoEventDelete> get copyWith => _$TodoEventDeleteCopyWithImpl<TodoEventDelete>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoEventDelete&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'TodoEvent.delete(id: $id)';
}


}

/// @nodoc
abstract mixin class $TodoEventDeleteCopyWith<$Res> implements $TodoEventCopyWith<$Res> {
  factory $TodoEventDeleteCopyWith(TodoEventDelete value, $Res Function(TodoEventDelete) _then) = _$TodoEventDeleteCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$TodoEventDeleteCopyWithImpl<$Res>
    implements $TodoEventDeleteCopyWith<$Res> {
  _$TodoEventDeleteCopyWithImpl(this._self, this._then);

  final TodoEventDelete _self;
  final $Res Function(TodoEventDelete) _then;

/// Create a copy of TodoEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(TodoEventDelete(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$TodoState {

 TodoStatus get status; List<TodoItem> get todos; AppException? get error;
/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoStateCopyWith<TodoState> get copyWith => _$TodoStateCopyWithImpl<TodoState>(this as TodoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.todos, todos)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(todos),error);

@override
String toString() {
  return 'TodoState(status: $status, todos: $todos, error: $error)';
}


}

/// @nodoc
abstract mixin class $TodoStateCopyWith<$Res>  {
  factory $TodoStateCopyWith(TodoState value, $Res Function(TodoState) _then) = _$TodoStateCopyWithImpl;
@useResult
$Res call({
 TodoStatus status, List<TodoItem> todos, AppException? error
});




}
/// @nodoc
class _$TodoStateCopyWithImpl<$Res>
    implements $TodoStateCopyWith<$Res> {
  _$TodoStateCopyWithImpl(this._self, this._then);

  final TodoState _self;
  final $Res Function(TodoState) _then;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? todos = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TodoStatus,todos: null == todos ? _self.todos : todos // ignore: cast_nullable_to_non_nullable
as List<TodoItem>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoState].
extension TodoStatePatterns on TodoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoState value)  $default,){
final _that = this;
switch (_that) {
case _TodoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoState value)?  $default,){
final _that = this;
switch (_that) {
case _TodoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TodoStatus status,  List<TodoItem> todos,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoState() when $default != null:
return $default(_that.status,_that.todos,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TodoStatus status,  List<TodoItem> todos,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _TodoState():
return $default(_that.status,_that.todos,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TodoStatus status,  List<TodoItem> todos,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _TodoState() when $default != null:
return $default(_that.status,_that.todos,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TodoState extends TodoState {
  const _TodoState({this.status = TodoStatus.initial, final  List<TodoItem> todos = const <TodoItem>[], this.error}): _todos = todos,super._();
  

@override@JsonKey() final  TodoStatus status;
 final  List<TodoItem> _todos;
@override@JsonKey() List<TodoItem> get todos {
  if (_todos is EqualUnmodifiableListView) return _todos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todos);
}

@override final  AppException? error;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoStateCopyWith<_TodoState> get copyWith => __$TodoStateCopyWithImpl<_TodoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._todos, _todos)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_todos),error);

@override
String toString() {
  return 'TodoState(status: $status, todos: $todos, error: $error)';
}


}

/// @nodoc
abstract mixin class _$TodoStateCopyWith<$Res> implements $TodoStateCopyWith<$Res> {
  factory _$TodoStateCopyWith(_TodoState value, $Res Function(_TodoState) _then) = __$TodoStateCopyWithImpl;
@override @useResult
$Res call({
 TodoStatus status, List<TodoItem> todos, AppException? error
});




}
/// @nodoc
class __$TodoStateCopyWithImpl<$Res>
    implements _$TodoStateCopyWith<$Res> {
  __$TodoStateCopyWithImpl(this._self, this._then);

  final _TodoState _self;
  final $Res Function(_TodoState) _then;

/// Create a copy of TodoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? todos = null,Object? error = freezed,}) {
  return _then(_TodoState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TodoStatus,todos: null == todos ? _self._todos : todos // ignore: cast_nullable_to_non_nullable
as List<TodoItem>,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}


}

// dart format on
