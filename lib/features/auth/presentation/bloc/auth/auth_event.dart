part of 'auth_bloc.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuth() = AuthEventCheckAuth;

  const factory AuthEvent.register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) = AuthEventRegister;

  const factory AuthEvent.loginWithEmail({
    required String email,
    required String password,
  }) = AuthEventLoginWithEmail;

  const factory AuthEvent.sendOtp(String phone) = AuthEventSendOtp;

  const factory AuthEvent.verifyOtp({
    required String verificationId,
    required String code,
  }) = AuthEventVerifyOtp;

  const factory AuthEvent.signInWithGoogle() = AuthEventSignInWithGoogle;

  const factory AuthEvent.logout() = AuthEventLogout;

  const factory AuthEvent.clearError() = AuthEventClearError;
}
