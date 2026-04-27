import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:zehnmind/core/error/app_exception.dart';

@lazySingleton
class AuthFirebaseSource {
  AuthFirebaseSource(this._auth, this._googleSignIn, this._firestore);

  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;

  User? get currentUser => _auth.currentUser;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<User> register({
    required String email,
    required String password,
    required String fullName,
    required String phone,
  }) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = cred.user!;
    await user.updateDisplayName(fullName);
    await _firestore.collection('users').doc(user.uid).set({
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'created_at': FieldValue.serverTimestamp(),
    });
    return user;
  }

  Future<User> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user!;
  }

  Future<String> sendOtp(String phone) async {
    final completer = Completer<String>();
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (cred) async {
        try {
          await _auth.signInWithCredential(cred);
        } catch (_) {}
      },
      verificationFailed: (e) {
        if (!completer.isCompleted) {
          completer.completeError(AppException.from(e));
        }
      },
      codeSent: (verificationId, _) {
        if (!completer.isCompleted) completer.complete(verificationId);
      },
      codeAutoRetrievalTimeout: (_) {},
    );
    return completer.future;
  }

  Future<User> verifyOtp(String verificationId, String code) async {
    final cred = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: code,
    );
    final result = await _auth.signInWithCredential(cred);
    final user = result.user!;
    await _ensureProfileExists(user);
    return user;
  }

  Future<User> signInWithGoogle() async {
    try {
      await _googleSignIn.initialize();
      final account = await _googleSignIn.authenticate();
      final auth = account.authentication;
      final cred = GoogleAuthProvider.credential(idToken: auth.idToken);
      final result = await _auth.signInWithCredential(cred);
      final user = result.user!;
      await _ensureProfileExists(user);
      return user;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw const GoogleSignInCancelledException();
      }
      rethrow;
    }
  }

  Future<void> _ensureProfileExists(User user) async {
    final doc = _firestore.collection('users').doc(user.uid);
    final snapshot = await doc.get();
    if (!snapshot.exists) {
      await doc.set({
        'full_name': user.displayName ?? '',
        'email': user.email ?? '',
        'phone': user.phoneNumber ?? '',
        'created_at': FieldValue.serverTimestamp(),
      });
    }
  }

  Future<void> logout() async {
    await Future.wait([_auth.signOut(), _googleSignIn.signOut()]);
  }
}
