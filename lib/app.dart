import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:zehnmind/config/di/get_it.dart';
import 'package:zehnmind/config/router/app_router.dart';
import 'package:zehnmind/core/i18n/translations.g.dart';
import 'package:zehnmind/core/services/language_service.dart';
import 'package:zehnmind/core/theme/app_theme.dart';
import 'package:zehnmind/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:zehnmind/features/auth/presentation/bloc/onboarding/onboarding_cubit.dart';
import 'package:zehnmind/firebase_options.dart';

Future<void> bootstrap() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
      ]);

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      if (!kDebugMode) {
        FlutterError.onError =
            FirebaseCrashlytics.instance.recordFlutterFatalError;
      }

      await configureDependencies();
      await getIt.allReady();
      await getIt<LanguageService>().initializeLanguage();

      runApp(TranslationProvider(child: const ZehnmindApp()));
    },
    (error, stack) {
      if (!kDebugMode) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      }
    },
  );
}

class ZehnmindApp extends StatefulWidget {
  const ZehnmindApp({super.key});

  @override
  State<ZehnmindApp> createState() => _ZehnmindAppState();
}

class _ZehnmindAppState extends State<ZehnmindApp> {
  late final AuthBloc _authBloc;
  late final OnboardingCubit _onboardingCubit;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _authBloc = getIt<AuthBloc>()..add(const AuthEvent.checkAuth());
    _onboardingCubit = getIt<OnboardingCubit>()..load();
    _router = buildRouter(_authBloc, _onboardingCubit);
  }

  @override
  void dispose() {
    _authBloc.close();
    _onboardingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>.value(value: _authBloc),
        BlocProvider<OnboardingCubit>.value(value: _onboardingCubit),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Zehnmind Tasks',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        routerConfig: _router,
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
      ),
    );
  }
}
