import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class OnboardingCubit extends Cubit<bool> {
  OnboardingCubit(this._prefs) : super(false);

  static const _key = 'onboarding_completed';

  final SharedPreferences _prefs;

  void load() {
    emit(_prefs.getBool(_key) ?? false);
  }

  Future<void> complete() async {
    await _prefs.setBool(_key, true);
    emit(true);
  }
}
