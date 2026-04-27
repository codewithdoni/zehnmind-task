// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_analytics/firebase_analytics.dart' as _i398;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i141;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:zehnmind/config/di/module/firebase_module.dart' as _i559;
import 'package:zehnmind/config/di/module/logger_module.dart' as _i484;
import 'package:zehnmind/config/di/module/shared_pref_module.dart' as _i9;
import 'package:zehnmind/core/safe_execution/safe_execution_manager.dart'
    as _i905;
import 'package:zehnmind/core/services/analytics_service.dart' as _i50;
import 'package:zehnmind/core/services/language_service.dart' as _i946;
import 'package:zehnmind/features/auth/data/data_source/auth_firebase_source.dart'
    as _i792;
import 'package:zehnmind/features/auth/data/repository/auth_repository.dart'
    as _i797;
import 'package:zehnmind/features/auth/domain/repository/base_auth_repository.dart'
    as _i791;
import 'package:zehnmind/features/auth/presentation/bloc/auth/auth_bloc.dart'
    as _i141;
import 'package:zehnmind/features/auth/presentation/bloc/onboarding/onboarding_cubit.dart'
    as _i52;
import 'package:zehnmind/features/home/data/data_source/todo_firestore_source.dart'
    as _i797;
import 'package:zehnmind/features/home/data/repository/todo_repository.dart'
    as _i520;
import 'package:zehnmind/features/home/domain/repository/base_todo_repository.dart'
    as _i259;
import 'package:zehnmind/features/home/presentation/bloc/todo_bloc.dart'
    as _i833;
import 'package:zehnmind/features/profile/data/data_source/profile_firestore_source.dart'
    as _i335;
import 'package:zehnmind/features/profile/data/repository/profile_repository.dart'
    as _i21;
import 'package:zehnmind/features/profile/domain/repository/base_profile_repository.dart'
    as _i1041;
import 'package:zehnmind/features/profile/presentation/bloc/profile_bloc.dart'
    as _i190;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final sharedPrefsModule = _$SharedPrefsModule();
    final firebaseModule = _$FirebaseModule();
    final loggerModule = _$LoggerModule();
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => sharedPrefsModule.provideSharedPreferences(),
      preResolve: true,
    );
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.lazySingleton<_i116.GoogleSignIn>(() => firebaseModule.googleSignIn);
    gh.lazySingleton<_i398.FirebaseAnalytics>(
      () => firebaseModule.firebaseAnalytics,
    );
    gh.lazySingleton<_i141.FirebaseCrashlytics>(
      () => firebaseModule.firebaseCrashlytics,
    );
    gh.lazySingleton<_i974.Logger>(() => loggerModule.logger);
    gh.lazySingleton<_i946.LanguageService>(
      () => _i946.LanguageService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i52.OnboardingCubit>(
      () => _i52.OnboardingCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i905.SafeExecutionManager>(
      () => _i905.SafeExecutionManager(gh<_i974.Logger>()),
    );
    gh.lazySingleton<_i50.AnalyticsService>(
      () => _i50.AnalyticsService(gh<_i398.FirebaseAnalytics>()),
    );
    gh.lazySingleton<_i792.AuthFirebaseSource>(
      () => _i792.AuthFirebaseSource(
        gh<_i59.FirebaseAuth>(),
        gh<_i116.GoogleSignIn>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i797.TodoFirestoreSource>(
      () => _i797.TodoFirestoreSource(
        gh<_i974.FirebaseFirestore>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.lazySingleton<_i335.ProfileFirestoreSource>(
      () => _i335.ProfileFirestoreSource(
        gh<_i974.FirebaseFirestore>(),
        gh<_i59.FirebaseAuth>(),
      ),
    );
    gh.lazySingleton<_i791.BaseAuthRepository>(
      () => _i797.AuthRepository(
        gh<_i792.AuthFirebaseSource>(),
        gh<_i905.SafeExecutionManager>(),
      ),
    );
    gh.lazySingleton<_i1041.BaseProfileRepository>(
      () => _i21.ProfileRepository(
        gh<_i335.ProfileFirestoreSource>(),
        gh<_i905.SafeExecutionManager>(),
      ),
    );
    gh.factory<_i141.AuthBloc>(
      () => _i141.AuthBloc(gh<_i791.BaseAuthRepository>()),
    );
    gh.lazySingleton<_i259.BaseTodoRepository>(
      () => _i520.TodoRepository(
        gh<_i797.TodoFirestoreSource>(),
        gh<_i905.SafeExecutionManager>(),
      ),
    );
    gh.factory<_i833.TodoBloc>(
      () => _i833.TodoBloc(gh<_i259.BaseTodoRepository>()),
    );
    gh.factory<_i190.ProfileBloc>(
      () => _i190.ProfileBloc(gh<_i1041.BaseProfileRepository>()),
    );
    return this;
  }
}

class _$SharedPrefsModule extends _i9.SharedPrefsModule {}

class _$FirebaseModule extends _i559.FirebaseModule {}

class _$LoggerModule extends _i484.LoggerModule {}
