import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/auth/core/application/auth_notifier.dart';
import '../features/auth/core/infrastructure/auth_repository.dart';
import '../features/auth/login/presentation/ask_for_email_screen.dart';
import '../features/auth/login/presentation/login_screen.dart';
import '../features/auth/onboarding/presentation/onboarding_screen.dart';
import '../features/auth/profile/presentation/set_profile_screen.dart';
import '../features/auth/register/presentation/register_screen.dart';
import '../features/core/infrastructure/setting_repository.dart';
import '../features/home/core/presentation/home_screen.dart';
import '../features/profile/presentation/profile_screen.dart';
import '../features/splash/presentation/splash_screen.dart';
import '../features/welcome/presentation/welcome_screen.dart';
import '../utils/common_import.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
class Router extends _$Router {
  @override
  GoRouter build() {
    return GoRouter(
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: Routes.splash,
      errorBuilder: (context, state) => ErrorScreen(
        errorMessage: state.error.toString(),
      ),
      redirect: (context, state) => _redirect(context, state, ref),
      refreshListenable: _AuthStateNotifier(ref),
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
          path: Routes.askForEmail,
          builder: (context, state) => const AskFormEmailScreen(),
        ),
        GoRoute(
          path: Routes.login,
          builder: (context, state) {
            final email = state.extra as Map<String, dynamic>;
            return LoginScreen(email: email["email"] as String);
          },
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
  BuildContext context,
  GoRouterState state,
  Ref ref,
) {
  final currentLocation = state.matchedLocation;

  final isAuthenticated = ref.read(authRepositoryProvider).isAuthenticated();

  log('isAuthenticated: $isAuthenticated');

  final isOnboardingCompleted =
      ref.read(settingRepositoryProvider).isOnboardingCompleted();
  final isWelcomeCompleted =
      ref.read(settingRepositoryProvider).isLetDoItCompleted();

  if (currentLocation == Routes.splash) {
    if (isOnboardingCompleted && isWelcomeCompleted) {
      return Routes.register;
    }
    return null;
  }

  if (currentLocation == Routes.welcome) {
    if (isWelcomeCompleted) {
      return Routes.onboarding;
    }
    return null;
  }

  if (currentLocation == Routes.onboarding) {
    if (isOnboardingCompleted) {
      return Routes.home;
    }
    return null;
  }

  if (isAuthenticated) {
    if (currentLocation == Routes.register ||
        currentLocation == Routes.login ||
        currentLocation == Routes.onboarding ||
        currentLocation == Routes.welcome) {
      return Routes.home;
    }
    if (currentLocation == Routes.home || currentLocation == Routes.profile) {
      return null;
    }
  }

  if (currentLocation == Routes.register) {
    if (isAuthenticated) {
      return Routes.home;
    }
    return null;
  }

  if (!isAuthenticated) {
    if (currentLocation == Routes.home) {
      return Routes.register;
    }
    return null;
  }

  return null;
}

class _AuthStateNotifier extends ChangeNotifier {
  _AuthStateNotifier(this._ref) {
    _ref.listen(
      authNotifierProvider,
      (_, __) {
        notifyListeners();
      },
    );
  }

  final Ref _ref;
}

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(errorMessage),
            SizedBox(height: AppDimensions.spacing16),
            TextButton(
              onPressed: () {
                context.go(Routes.home);
              },
              child: const Text('Go to home'),
            ),
          ],
        ),
      ),
    );
  }
}
