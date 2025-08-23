import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/auth/core/application/auth_notifier.dart';
import '../features/auth/login/presentation/login_screen.dart';
import '../features/auth/onboarding/presentation/onboarding_screen.dart';
import '../features/auth/profile/presentation/set_profile_screen.dart';
import '../features/auth/register/presentation/register_screen.dart';
import '../features/core/infrastructure/setting_repository.dart';
import '../features/home/core/presentation/home_screen.dart';
import '../features/profile/presentation/profile_screen.dart';
import '../features/splash/presentation/splash_screen.dart';
import '../features/welcome/presentation/welcome_screen.dart';
import 'goroute_observer.dart';
import 'routes.dart';

part 'router.g.dart';

@riverpod
class Router extends _$Router {
  @override
  GoRouter build() {
    final authState = ref.watch(authNotifierProvider);
    final isOnboardingCompleted =
        ref.watch(settingRepositoryProvider).isOnboardingCompleted;

    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: Routes.splash,
      redirect: (context, state) =>
          _redirect(context, state, authState, isOnboardingCompleted),
      refreshListenable: _AuthStateNotifier(ref),
      observers: [
        GoRouterObserver(),
      ],
      routes: [
        GoRoute(
          path: Routes.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: Routes.welcome,
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          path: Routes.onboarding,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: Routes.register,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: Routes.setProfile,
          builder: (context, state) => const SetProfileScreen(),
        ),
        GoRoute(
          path: Routes.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: Routes.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: Routes.profile,
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    );
  }
}

String? _redirect(
  context,
  state,
  AuthState authState,
  bool isOnboardingCompleted,
) {
  final currentLocation = state.matchedLocation;

  final isAuthenticated = authState.maybeWhen(
    authenticated: (_) => true,
    orElse: () => false,
  );

  if (currentLocation == Routes.splash) {
    if (!isOnboardingCompleted) {
      return Routes.onboarding;
    } else if (!isAuthenticated) {
      return Routes.register;
    } else {
      return Routes.home;
    }
  }

  if (currentLocation == Routes.onboarding) {
    if (isOnboardingCompleted) {
      return isAuthenticated ? Routes.home : Routes.register;
    }
    return null;
  }

  if (!isOnboardingCompleted) {
    return Routes.onboarding;
  }

  final isOnAuthFlow = currentLocation == Routes.register ||
      currentLocation == Routes.login ||
      currentLocation == Routes.setProfile;

  if (isAuthenticated && isOnAuthFlow) {
    return Routes.home;
  }

  final isProtectedRoute =
      currentLocation == Routes.home || currentLocation == Routes.profile;

  if (!isAuthenticated && isProtectedRoute) {
    return Routes.register;
  }

  return null;
}

class _AuthStateNotifier extends ChangeNotifier {
  _AuthStateNotifier(this._ref) {
    _ref.listen(authNotifierProvider, (_, __) {
      notifyListeners();
    });
  }

  final Ref _ref;
}
