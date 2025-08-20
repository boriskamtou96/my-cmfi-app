import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/onboarding/presentation/onboarding_screen.dart';
import '../features/splash/presentation/splash_screen.dart';
import '../features/welcome/presentation/welcome_screen.dart';
import 'routes.dart';

part 'router.g.dart';

@riverpod
class Router extends _$Router {
  @override
  GoRouter build() {
    return GoRouter(
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
      ],
    );
  }
}
