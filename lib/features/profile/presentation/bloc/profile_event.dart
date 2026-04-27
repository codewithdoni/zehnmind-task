part of 'profile_bloc.dart';

@freezed
sealed class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.load() = ProfileEventLoad;
  const factory ProfileEvent.update(UserProfile profile) = ProfileEventUpdate;
}
