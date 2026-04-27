import 'package:zehnmind/features/profile/domain/entity/user_profile.dart';

abstract interface class BaseProfileRepository {
  Future<UserProfile> getProfile();
  Stream<UserProfile> watchProfile();
  Future<void> updateProfile(UserProfile profile);
}
