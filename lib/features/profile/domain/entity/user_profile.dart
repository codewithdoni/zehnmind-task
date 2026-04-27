import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
sealed class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String uid,
    required String fullName,
    required String email,
    required String phone,
    DateTime? createdAt,
  }) = _UserProfile;

  const UserProfile._();

  factory UserProfile.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? <String, dynamic>{};
    return UserProfile(
      uid: doc.id,
      fullName: data['full_name'] as String? ?? '',
      email: data['email'] as String? ?? '',
      phone: data['phone'] as String? ?? '',
      createdAt: (data['created_at'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toUpdateMap() => {
    'full_name': fullName,
    'email': email,
    'phone': phone,
  };
}
