import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:zehnmind/config/di/get_it.dart';
import 'package:zehnmind/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:zehnmind/features/auth/presentation/bloc/onboarding/onboarding_cubit.dart';
import 'package:zehnmind/features/auth/presentation/screen/login_screen.dart';
import 'package:zehnmind/features/auth/presentation/screen/onboarding_screen.dart';
import 'package:zehnmind/features/auth/presentation/screen/otp_screen.dart';
import 'package:zehnmind/features/auth/presentation/screen/register_screen.dart';
import 'package:zehnmind/features/home/presentation/bloc/todo_bloc.dart';
import 'package:zehnmind/features/home/presentation/screen/home_screen.dart';
import 'package:zehnmind/features/home/presentation/screen/main_shell.dart';
import 'package:zehnmind/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:zehnmind/features/profile/presentation/screen/edit_profile_screen.dart';
import 'package:zehnmind/features/profile/presentation/screen/profile_screen.dart';

class AppRoute {
  AppRoute._();
  static const splash = '/';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const register = '/register';
  static const otp = '/otp';
  static const home = '/home';
  static const profile = '/profile';
  static const editProfile = '/profile/edit';
}

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter buildRouter(AuthBloc authBloc, OnboardingCubit onboardingCubit) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoute.splash,
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final authState = authBloc.state;
      final loc = state.matchedLocation;

      if (authState.status == AuthStatus.initial) {
        return loc == AppRoute.splash ? null : AppRoute.splash;
      }

      final loggedIn = authState.status == AuthStatus.authenticated;
      final authRoutes = {
        AppRoute.onboarding,
        AppRoute.login,
        AppRoute.register,
        AppRoute.otp,
        AppRoute.splash,
      };
      final inAuthRoute = authRoutes.contains(loc);

      if (!loggedIn) {
        if (loc == AppRoute.splash) {
          return onboardingCubit.state ? AppRoute.login : AppRoute.onboarding;
        }
        return inAuthRoute ? null : AppRoute.login;
      }

      if (loggedIn && inAuthRoute) {
        return AppRoute.home;
      }
      return null;
    },
    routes: [
      GoRoute(path: AppRoute.splash, builder: (_, __) => const _SplashScreen()),
      GoRoute(
        path: AppRoute.onboarding,
        builder: (_, __) => const OnboardingScreen(),
      ),
      GoRoute(path: AppRoute.login, builder: (_, __) => const LoginScreen()),
      GoRoute(
        path: AppRoute.register,
        builder: (_, __) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoute.otp,
        builder: (_, state) {
          final extra = state.extra! as Map<String, dynamic>;
          return OtpScreen(
            verificationId: extra['verificationId'] as String,
            phoneNumber: extra['phoneNumber'] as String,
          );
        },
      ),
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (_, __, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: AppRoute.home,
            pageBuilder: (_, __) => NoTransitionPage(
              child: BlocProvider(
                create: (_) =>
                    getIt<TodoBloc>()..add(const TodoEvent.startWatching()),
                child: const HomeScreen(),
              ),
            ),
          ),
          GoRoute(
            path: AppRoute.profile,
            pageBuilder: (_, __) => NoTransitionPage(
              child: BlocProvider(
                create: (_) =>
                    getIt<ProfileBloc>()..add(const ProfileEvent.load()),
                child: const ProfileScreen(),
              ),
            ),
          ),
        ],
      ),
      GoRoute(
        path: AppRoute.editProfile,
        parentNavigatorKey: rootNavigatorKey,
        builder: (_, __) => const EditProfileScreen(),
      ),
    ],
  );
}

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final dynamic _subscription;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
