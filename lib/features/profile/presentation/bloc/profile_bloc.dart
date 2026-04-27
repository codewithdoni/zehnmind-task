import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zehnmind/core/error/app_exception.dart';
import 'package:zehnmind/features/profile/domain/entity/user_profile.dart';
import 'package:zehnmind/features/profile/domain/repository/base_profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this._repo) : super(const ProfileState()) {
    on<ProfileEventLoad>(_onLoad);
    on<ProfileEventUpdate>(_onUpdate);
  }

  final BaseProfileRepository _repo;

  Future<void> _onLoad(ProfileEventLoad e, Emitter<ProfileState> emit) async {
    emit(state.copyWith(status: ProfileStatus.loading));
    await emit.forEach<UserProfile>(
      _repo.watchProfile(),
      onData: (profile) =>
          state.copyWith(status: ProfileStatus.success, profile: profile),
      onError: (error, _) {
        return state.copyWith(
          status: ProfileStatus.error,
          error: AppException.from(error),
        );
      },
    );
  }

  Future<void> _onUpdate(
    ProfileEventUpdate e,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.saving));
    try {
      await _repo.updateProfile(e.profile);
      emit(state.copyWith(status: ProfileStatus.success, profile: e.profile));
    } on AppException catch (err) {
      emit(state.copyWith(status: ProfileStatus.error, error: err));
    }
  }
}
