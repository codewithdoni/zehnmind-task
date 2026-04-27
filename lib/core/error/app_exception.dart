import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:cloud_firestore/cloud_firestore.dart' as fs;

sealed class AppException implements Exception {
  const AppException([this.message]);

  final String? message;

  @override
  String toString() => message ?? runtimeType.toString();

  static AppException from(Object error) {
    if (error is AppException) return error;
    if (error is fb.FirebaseAuthException) {
      return _mapAuthException(error);
    }
    if (error is fs.FirebaseException) {
      if (error.code == 'unavailable' ||
          error.code == 'network-request-failed') {
        return const NoInternetConnectionException();
      }
      if (error.code == 'permission-denied') {
        return const UnauthorizedException();
      }
      return UnknownAppException(error.message ?? error.code);
    }
    return UnknownAppException(error.toString());
  }

  static AppException _mapAuthException(fb.FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return const InvalidEmailException();
      case 'user-not-found':
      case 'wrong-password':
      case 'invalid-credential':
        return const InvalidCredentialsException();
      case 'email-already-in-use':
        return const EmailInUseException();
      case 'weak-password':
        return const WeakPasswordException();
      case 'user-disabled':
        return const UserDisabledException();
      case 'invalid-verification-code':
      case 'invalid-verification-id':
        return const InvalidOtpException();
      case 'network-request-failed':
        return const NoInternetConnectionException();
      case 'too-many-requests':
        return const TooManyRequestsException();
      case 'operation-not-allowed':
        return UnknownAppException(e.message);
      default:
        return UnknownAppException(e.message ?? e.code);
    }
  }
}

class NoInternetConnectionException extends AppException {
  const NoInternetConnectionException() : super('No internet connection');
}

class UnauthorizedException extends AppException {
  const UnauthorizedException() : super('Unauthorized');
}

class InvalidCredentialsException extends AppException {
  const InvalidCredentialsException() : super('Invalid email or password');
}

class InvalidEmailException extends AppException {
  const InvalidEmailException() : super('Invalid email format');
}

class EmailInUseException extends AppException {
  const EmailInUseException() : super('Email is already in use');
}

class WeakPasswordException extends AppException {
  const WeakPasswordException() : super('Password is too weak');
}

class UserDisabledException extends AppException {
  const UserDisabledException() : super('User account is disabled');
}

class InvalidOtpException extends AppException {
  const InvalidOtpException() : super('Invalid OTP code');
}

class TooManyRequestsException extends AppException {
  const TooManyRequestsException() : super('Too many requests. Try later');
}

class GoogleSignInCancelledException extends AppException {
  const GoogleSignInCancelledException()
    : super('Google sign-in was cancelled');
}

class UnknownAppException extends AppException {
  const UnknownAppException([super.message]);
}
