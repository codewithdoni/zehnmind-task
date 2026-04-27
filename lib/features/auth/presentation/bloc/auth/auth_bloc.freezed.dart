// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthEventCheckAuth value)?  checkAuth,TResult Function( AuthEventRegister value)?  register,TResult Function( AuthEventLoginWithEmail value)?  loginWithEmail,TResult Function( AuthEventSendOtp value)?  sendOtp,TResult Function( AuthEventVerifyOtp value)?  verifyOtp,TResult Function( AuthEventSignInWithGoogle value)?  signInWithGoogle,TResult Function( AuthEventLogout value)?  logout,TResult Function( AuthEventClearError value)?  clearError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthEventCheckAuth() when checkAuth != null:
return checkAuth(_that);case AuthEventRegister() when register != null:
return register(_that);case AuthEventLoginWithEmail() when loginWithEmail != null:
return loginWithEmail(_that);case AuthEventSendOtp() when sendOtp != null:
return sendOtp(_that);case AuthEventVerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case AuthEventSignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle(_that);case AuthEventLogout() when logout != null:
return logout(_that);case AuthEventClearError() when clearError != null:
return clearError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthEventCheckAuth value)  checkAuth,required TResult Function( AuthEventRegister value)  register,required TResult Function( AuthEventLoginWithEmail value)  loginWithEmail,required TResult Function( AuthEventSendOtp value)  sendOtp,required TResult Function( AuthEventVerifyOtp value)  verifyOtp,required TResult Function( AuthEventSignInWithGoogle value)  signInWithGoogle,required TResult Function( AuthEventLogout value)  logout,required TResult Function( AuthEventClearError value)  clearError,}){
final _that = this;
switch (_that) {
case AuthEventCheckAuth():
return checkAuth(_that);case AuthEventRegister():
return register(_that);case AuthEventLoginWithEmail():
return loginWithEmail(_that);case AuthEventSendOtp():
return sendOtp(_that);case AuthEventVerifyOtp():
return verifyOtp(_that);case AuthEventSignInWithGoogle():
return signInWithGoogle(_that);case AuthEventLogout():
return logout(_that);case AuthEventClearError():
return clearError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthEventCheckAuth value)?  checkAuth,TResult? Function( AuthEventRegister value)?  register,TResult? Function( AuthEventLoginWithEmail value)?  loginWithEmail,TResult? Function( AuthEventSendOtp value)?  sendOtp,TResult? Function( AuthEventVerifyOtp value)?  verifyOtp,TResult? Function( AuthEventSignInWithGoogle value)?  signInWithGoogle,TResult? Function( AuthEventLogout value)?  logout,TResult? Function( AuthEventClearError value)?  clearError,}){
final _that = this;
switch (_that) {
case AuthEventCheckAuth() when checkAuth != null:
return checkAuth(_that);case AuthEventRegister() when register != null:
return register(_that);case AuthEventLoginWithEmail() when loginWithEmail != null:
return loginWithEmail(_that);case AuthEventSendOtp() when sendOtp != null:
return sendOtp(_that);case AuthEventVerifyOtp() when verifyOtp != null:
return verifyOtp(_that);case AuthEventSignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle(_that);case AuthEventLogout() when logout != null:
return logout(_that);case AuthEventClearError() when clearError != null:
return clearError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  checkAuth,TResult Function( String fullName,  String email,  String phone,  String password)?  register,TResult Function( String email,  String password)?  loginWithEmail,TResult Function( String phone)?  sendOtp,TResult Function( String verificationId,  String code)?  verifyOtp,TResult Function()?  signInWithGoogle,TResult Function()?  logout,TResult Function()?  clearError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthEventCheckAuth() when checkAuth != null:
return checkAuth();case AuthEventRegister() when register != null:
return register(_that.fullName,_that.email,_that.phone,_that.password);case AuthEventLoginWithEmail() when loginWithEmail != null:
return loginWithEmail(_that.email,_that.password);case AuthEventSendOtp() when sendOtp != null:
return sendOtp(_that.phone);case AuthEventVerifyOtp() when verifyOtp != null:
return verifyOtp(_that.verificationId,_that.code);case AuthEventSignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle();case AuthEventLogout() when logout != null:
return logout();case AuthEventClearError() when clearError != null:
return clearError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  checkAuth,required TResult Function( String fullName,  String email,  String phone,  String password)  register,required TResult Function( String email,  String password)  loginWithEmail,required TResult Function( String phone)  sendOtp,required TResult Function( String verificationId,  String code)  verifyOtp,required TResult Function()  signInWithGoogle,required TResult Function()  logout,required TResult Function()  clearError,}) {final _that = this;
switch (_that) {
case AuthEventCheckAuth():
return checkAuth();case AuthEventRegister():
return register(_that.fullName,_that.email,_that.phone,_that.password);case AuthEventLoginWithEmail():
return loginWithEmail(_that.email,_that.password);case AuthEventSendOtp():
return sendOtp(_that.phone);case AuthEventVerifyOtp():
return verifyOtp(_that.verificationId,_that.code);case AuthEventSignInWithGoogle():
return signInWithGoogle();case AuthEventLogout():
return logout();case AuthEventClearError():
return clearError();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  checkAuth,TResult? Function( String fullName,  String email,  String phone,  String password)?  register,TResult? Function( String email,  String password)?  loginWithEmail,TResult? Function( String phone)?  sendOtp,TResult? Function( String verificationId,  String code)?  verifyOtp,TResult? Function()?  signInWithGoogle,TResult? Function()?  logout,TResult? Function()?  clearError,}) {final _that = this;
switch (_that) {
case AuthEventCheckAuth() when checkAuth != null:
return checkAuth();case AuthEventRegister() when register != null:
return register(_that.fullName,_that.email,_that.phone,_that.password);case AuthEventLoginWithEmail() when loginWithEmail != null:
return loginWithEmail(_that.email,_that.password);case AuthEventSendOtp() when sendOtp != null:
return sendOtp(_that.phone);case AuthEventVerifyOtp() when verifyOtp != null:
return verifyOtp(_that.verificationId,_that.code);case AuthEventSignInWithGoogle() when signInWithGoogle != null:
return signInWithGoogle();case AuthEventLogout() when logout != null:
return logout();case AuthEventClearError() when clearError != null:
return clearError();case _:
  return null;

}
}

}

/// @nodoc


class AuthEventCheckAuth implements AuthEvent {
  const AuthEventCheckAuth();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEventCheckAuth);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.checkAuth()';
}


}




/// @nodoc


class AuthEventRegister implements AuthEvent {
  const AuthEventRegister({required this.fullName, required this.email, required this.phone, required this.password});
  

 final  String fullName;
 final  String email;
 final  String phone;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEventRegisterCopyWith<AuthEventRegister> get copyWith => _$AuthEventRegisterCopyWithImpl<AuthEventRegister>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEventRegister&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,fullName,email,phone,password);

@override
String toString() {
  return 'AuthEvent.register(fullName: $fullName, email: $email, phone: $phone, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthEventRegisterCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthEventRegisterCopyWith(AuthEventRegister value, $Res Function(AuthEventRegister) _then) = _$AuthEventRegisterCopyWithImpl;
@useResult
$Res call({
 String fullName, String email, String phone, String password
});




}
/// @nodoc
class _$AuthEventRegisterCopyWithImpl<$Res>
    implements $AuthEventRegisterCopyWith<$Res> {
  _$AuthEventRegisterCopyWithImpl(this._self, this._then);

  final AuthEventRegister _self;
  final $Res Function(AuthEventRegister) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? email = null,Object? phone = null,Object? password = null,}) {
  return _then(AuthEventRegister(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthEventLoginWithEmail implements AuthEvent {
  const AuthEventLoginWithEmail({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEventLoginWithEmailCopyWith<AuthEventLoginWithEmail> get copyWith => _$AuthEventLoginWithEmailCopyWithImpl<AuthEventLoginWithEmail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEventLoginWithEmail&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.loginWithEmail(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $AuthEventLoginWithEmailCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthEventLoginWithEmailCopyWith(AuthEventLoginWithEmail value, $Res Function(AuthEventLoginWithEmail) _then) = _$AuthEventLoginWithEmailCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$AuthEventLoginWithEmailCopyWithImpl<$Res>
    implements $AuthEventLoginWithEmailCopyWith<$Res> {
  _$AuthEventLoginWithEmailCopyWithImpl(this._self, this._then);

  final AuthEventLoginWithEmail _self;
  final $Res Function(AuthEventLoginWithEmail) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(AuthEventLoginWithEmail(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthEventSendOtp implements AuthEvent {
  const AuthEventSendOtp(this.phone);
  

 final  String phone;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEventSendOtpCopyWith<AuthEventSendOtp> get copyWith => _$AuthEventSendOtpCopyWithImpl<AuthEventSendOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEventSendOtp&&(identical(other.phone, phone) || other.phone == phone));
}


@override
int get hashCode => Object.hash(runtimeType,phone);

@override
String toString() {
  return 'AuthEvent.sendOtp(phone: $phone)';
}


}

/// @nodoc
abstract mixin class $AuthEventSendOtpCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthEventSendOtpCopyWith(AuthEventSendOtp value, $Res Function(AuthEventSendOtp) _then) = _$AuthEventSendOtpCopyWithImpl;
@useResult
$Res call({
 String phone
});




}
/// @nodoc
class _$AuthEventSendOtpCopyWithImpl<$Res>
    implements $AuthEventSendOtpCopyWith<$Res> {
  _$AuthEventSendOtpCopyWithImpl(this._self, this._then);

  final AuthEventSendOtp _self;
  final $Res Function(AuthEventSendOtp) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? phone = null,}) {
  return _then(AuthEventSendOtp(
null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthEventVerifyOtp implements AuthEvent {
  const AuthEventVerifyOtp({required this.verificationId, required this.code});
  

 final  String verificationId;
 final  String code;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthEventVerifyOtpCopyWith<AuthEventVerifyOtp> get copyWith => _$AuthEventVerifyOtpCopyWithImpl<AuthEventVerifyOtp>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEventVerifyOtp&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,verificationId,code);

@override
String toString() {
  return 'AuthEvent.verifyOtp(verificationId: $verificationId, code: $code)';
}


}

/// @nodoc
abstract mixin class $AuthEventVerifyOtpCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthEventVerifyOtpCopyWith(AuthEventVerifyOtp value, $Res Function(AuthEventVerifyOtp) _then) = _$AuthEventVerifyOtpCopyWithImpl;
@useResult
$Res call({
 String verificationId, String code
});




}
/// @nodoc
class _$AuthEventVerifyOtpCopyWithImpl<$Res>
    implements $AuthEventVerifyOtpCopyWith<$Res> {
  _$AuthEventVerifyOtpCopyWithImpl(this._self, this._then);

  final AuthEventVerifyOtp _self;
  final $Res Function(AuthEventVerifyOtp) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? verificationId = null,Object? code = null,}) {
  return _then(AuthEventVerifyOtp(
verificationId: null == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class AuthEventSignInWithGoogle implements AuthEvent {
  const AuthEventSignInWithGoogle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEventSignInWithGoogle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signInWithGoogle()';
}


}




/// @nodoc


class AuthEventLogout implements AuthEvent {
  const AuthEventLogout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEventLogout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logout()';
}


}




/// @nodoc


class AuthEventClearError implements AuthEvent {
  const AuthEventClearError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEventClearError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.clearError()';
}


}




/// @nodoc
mixin _$AuthState {

 AuthStatus get status; String? get verificationId; String? get phoneNumber; AppException? get error;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.status, status) || other.status == status)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,verificationId,phoneNumber,error);

@override
String toString() {
  return 'AuthState(status: $status, verificationId: $verificationId, phoneNumber: $phoneNumber, error: $error)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 AuthStatus status, String? verificationId, String? phoneNumber, AppException? error
});




}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? verificationId = freezed,Object? phoneNumber = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthStatus status,  String? verificationId,  String? phoneNumber,  AppException? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.status,_that.verificationId,_that.phoneNumber,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthStatus status,  String? verificationId,  String? phoneNumber,  AppException? error)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.status,_that.verificationId,_that.phoneNumber,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthStatus status,  String? verificationId,  String? phoneNumber,  AppException? error)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.status,_that.verificationId,_that.phoneNumber,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({this.status = AuthStatus.initial, this.verificationId, this.phoneNumber, this.error});
  

@override@JsonKey() final  AuthStatus status;
@override final  String? verificationId;
@override final  String? phoneNumber;
@override final  AppException? error;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.status, status) || other.status == status)&&(identical(other.verificationId, verificationId) || other.verificationId == verificationId)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,status,verificationId,phoneNumber,error);

@override
String toString() {
  return 'AuthState(status: $status, verificationId: $verificationId, phoneNumber: $phoneNumber, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 AuthStatus status, String? verificationId, String? phoneNumber, AppException? error
});




}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? verificationId = freezed,Object? phoneNumber = freezed,Object? error = freezed,}) {
  return _then(_AuthState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as AuthStatus,verificationId: freezed == verificationId ? _self.verificationId : verificationId // ignore: cast_nullable_to_non_nullable
as String?,phoneNumber: freezed == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as AppException?,
  ));
}


}

// dart format on
