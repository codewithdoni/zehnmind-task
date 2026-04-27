import 'package:injectable/injectable.dart';
import 'package:zehnmind/core/safe_execution/safe_execution_manager.dart';
import 'package:zehnmind/features/profile/data/data_source/profile_firestore_source.dart';
import 'package:zehnmind/features/profile/domain/entity/user_profile.dart';
import 'package:zehnmind/features/profile/domain/repository/base_profile_repository.dart';

@LazySingleton(as: BaseProfileRepository)
class ProfileRepository implements BaseProfileRepository {
  ProfileRepository(this._source, this._safe);

  final ProfileFirestoreSource _source;
  final SafeExecutionManager _safe;

  @override
  Future<UserProfile> getProfile() => _safe.run(_source.getProfile);

  @override
  Stream<UserProfile> watchProfile() => _source.watchProfile();

  @override
  Future<void> updateProfile(UserProfile profile) =>
      _safe.run(() => _source.updateProfile(profile));
}
