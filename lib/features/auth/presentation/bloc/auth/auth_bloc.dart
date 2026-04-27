import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zehnmind/core/error/app_exception.dart';
import 'package:zehnmind/features/auth/domain/repository/base_auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repo) : super(const AuthState()) {
    on<AuthEventCheckAuth>(_onCheckAuth);
    on<AuthEventRegister>(_onRegister);
    on<AuthEventLoginWithEmail>(_onLoginEmail);
    on<AuthEventSendOtp>(_onSendOtp);
    on<AuthEventVerifyOtp>(_onVerifyOtp);
    on<AuthEventSignInWithGoogle>(_onGoogle);
    on<AuthEventLogout>(_onLogout);
    on<AuthEventClearError>((_, emit) => emit(state.copyWith(error: null)));
  }

  final BaseAuthRepository _repo;

  void _onCheckAuth(AuthEventCheckAuth e, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        status: _repo.isAuthenticated
            ? AuthStatus.authenticated
            : AuthStatus.unauthenticated,
      ),
    );
  }

  Future<void> _onRegister(AuthEventRegister e, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading, error: null));
    try {
      await _repo.register(
        fullName: e.fullName,
        email: e.email,
        phone: e.phone,
        password: e.password,
      );
      emit(state.copyWith(status: AuthStatus.authenticated));
    } on AppException catch (err) {
      emit(state.copyWith(status: AuthStatus.error, error: err));
    }
  }

  Future<void> _onLoginEmail(
    AuthEventLoginWithEmail e,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, error: null));
    try {
      await _repo.loginWithEmail(email: e.email, password: e.password);
      emit(state.copyWith(status: AuthStatus.authenticated));
    } on AppException catch (err) {
      emit(state.copyWith(status: AuthStatus.error, error: err));
    }
  }

  Future<void> _onSendOtp(AuthEventSendOtp e, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: AuthStatus.loading, error: null));
    try {
      final id = await _repo.sendOtp(e.phone);
      emit(
        state.copyWith(
          status: AuthStatus.otpSent,
          verificationId: id,
          phoneNumber: e.phone,
        ),
      );
    } on AppException catch (err) {
      emit(state.copyWith(status: AuthStatus.error, error: err));
    }
  }

  Future<void> _onVerifyOtp(
    AuthEventVerifyOtp e,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, error: null));
    try {
      await _repo.verifyOtp(verificationId: e.verificationId, code: e.code);
      emit(state.copyWith(status: AuthStatus.authenticated));
    } on AppException catch (err) {
      emit(state.copyWith(status: AuthStatus.error, error: err));
    }
  }

  Future<void> _onGoogle(
    AuthEventSignInWithGoogle e,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(status: AuthStatus.loading, error: null));
    try {
      await _repo.signInWithGoogle();
      emit(state.copyWith(status: AuthStatus.authenticated));
    } on AppException catch (err) {
      emit(state.copyWith(status: AuthStatus.error, error: err));
    }
  }

  Future<void> _onLogout(AuthEventLogout e, Emitter<AuthState> emit) async {
    try {
      await _repo.logout();
    } catch (_) {}
    emit(const AuthState(status: AuthStatus.unauthenticated));
  }
}
