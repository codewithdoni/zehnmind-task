import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:zehnmind/core/safe_execution/safe_execution_manager.dart';
import 'package:zehnmind/features/auth/data/data_source/auth_firebase_source.dart';
import 'package:zehnmind/features/auth/domain/repository/base_auth_repository.dart';

@LazySingleton(as: BaseAuthRepository)
class AuthRepository implements BaseAuthRepository {
  AuthRepository(this._source, this._safe);

  final AuthFirebaseSource _source;
  final SafeExecutionManager _safe;

  @override
  bool get isAuthenticated => _source.currentUser != null;

  @override
  String? get currentUserId => _source.currentUser?.uid;

  @override
  Stream<User?> get authStateChanges => _source.authStateChanges;

  @override
  Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) => _safe.run(
    () => _source.register(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
    ),
  );

  @override
  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) =>
      _safe.run(() => _source.loginWithEmail(email: email, password: password));

  @override
  Future<String> sendOtp(String phone) =>
      _safe.run(() => _source.sendOtp(phone));

  @override
  Future<void> verifyOtp({
    required String verificationId,
    required String code,
  }) => _safe.run(() => _source.verifyOtp(verificationId, code));

  @override
  Future<void> signInWithGoogle() => _safe.run(_source.signInWithGoogle);

  @override
  Future<void> logout() => _safe.run(_source.logout);
}
