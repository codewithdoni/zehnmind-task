abstract interface class BaseAuthRepository {
  bool get isAuthenticated;
  String? get currentUserId;
  Stream<dynamic> get authStateChanges;

  Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  });

  Future<void> loginWithEmail({
    required String email,
    required String password,
  });

  Future<String> sendOtp(String phone);

  Future<void> verifyOtp({
    required String verificationId,
    required String code,
  });

  Future<void> signInWithGoogle();

  Future<void> logout();
}
