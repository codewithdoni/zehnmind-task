part of 'auth_bloc.dart';

enum AuthStatus {
  initial,
  loading,
  authenticated,
  unauthenticated,
  otpSent,
  error,
}

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.initial) AuthStatus status,
    String? verificationId,
    String? phoneNumber,
    AppException? error,
  }) = _AuthState;
}
