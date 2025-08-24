import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
import '../utils/common_import.dart';
import 'goroute_observer.dart';

part 'router.g.dart';

@riverpod
class Router extends _$Router {
  @override
  GoRouter build() {
    return GoRouter(
      debugLogDiagnostics: true,
      initialLocation: Routes.splash,
      errorBuilder: (context, state) => ErrorScreen(
        errorMessage: state.error.toString(),
      ),
      redirect: (context, state) => _redirect(context, state, ref),
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
  BuildContext context,
  GoRouterState state,
  Ref ref,
) {
  final client = Supabase.instance.client;
  final currentLocation = state.matchedLocation;

  final isAuthenticated = client.auth.currentUser != null;
  final isOnboardingCompleted =
      ref.read(settingRepositoryProvider).isOnboardingCompleted();
  final isWelcomeCompleted =
      ref.read(settingRepositoryProvider).isLetDoItCompleted();
  final isProfileCompleted =
      ref.read(settingRepositoryProvider).isProfileCompleted();

  // Skip redirection for splash screen
  if (currentLocation == Routes.splash) {
    return null;
  }

  // 1. Welcome flow - First time users must see welcome
  if (!isWelcomeCompleted && currentLocation != Routes.welcome) {
    return Routes.welcome;
  }

  // 2. Onboarding flow - After welcome, show onboarding if not completed
  if (isWelcomeCompleted &&
      !isOnboardingCompleted &&
      currentLocation != Routes.onboarding) {
    return Routes.onboarding;
  }

  // 3. Authentication flow - After onboarding, require auth
  if (isOnboardingCompleted && !isAuthenticated) {
    if (currentLocation != Routes.register && currentLocation != Routes.login) {
      return Routes.register;
    }
    return null; // Allow staying on register/login
  }

  // 4. Profile setup flow - After auth, ensure profile is set
  if (isAuthenticated && !isProfileCompleted) {
    if (currentLocation != Routes.setProfile) {
      // return Routes.setProfile;
      return Routes.home;
    }
    return null; // Allow staying on setProfile
  }

  // 5. Authenticated users with complete profile
  if (isAuthenticated && isProfileCompleted) {
    // Redirect away from auth and setup screens to home
    if (currentLocation == Routes.register ||
        currentLocation == Routes.login ||
        currentLocation == Routes.setProfile ||
        currentLocation == Routes.onboarding ||
        currentLocation == Routes.welcome) {
      return Routes.home;
    }

    // Allow access to authenticated areas
    if (currentLocation == Routes.home || currentLocation == Routes.profile) {
      return null;
    }
  }

  // 6. Protect authenticated routes
  if (!isAuthenticated && currentLocation == Routes.home) {
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
