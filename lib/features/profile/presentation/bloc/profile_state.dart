part of 'profile_bloc.dart';

enum ProfileStatus { initial, loading, success, saving, error }

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState({
    @Default(ProfileStatus.initial) ProfileStatus status,
    UserProfile? profile,
    AppException? error,
  }) = _ProfileState;
}
