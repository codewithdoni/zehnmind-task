import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:zehnmind/core/error/app_exception.dart';
import 'package:zehnmind/features/profile/domain/entity/user_profile.dart';

@lazySingleton
class ProfileFirestoreSource {
  ProfileFirestoreSource(this._firestore, this._auth);

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  DocumentReference<Map<String, dynamic>> _doc() {
    final uid = _auth.currentUser?.uid;
    if (uid == null) throw const UnauthorizedException();
    return _firestore.collection('users').doc(uid);
  }

  Future<UserProfile> getProfile() async {
    final snap = await _doc().get();
    return UserProfile.fromFirestore(snap);
  }

  Stream<UserProfile> watchProfile() {
    return _doc().snapshots().map(UserProfile.fromFirestore);
  }

  Future<void> updateProfile(UserProfile profile) async {
    await _doc().update(profile.toUpdateMap());
  }
}
