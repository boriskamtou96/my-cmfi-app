import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../infrastructure/auth_repository.dart';

part 'auth_notifier.g.dart';
part 'auth_notifier.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(AuthResponse? user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(Object error) = _Error;
}

@riverpod
class AuthNotifier extends _$AuthNotifier {
  final _log = Logger('AuthNotifier');

  @override
  AuthState build() {
    return const AuthState.initial();
  }

  Future<void> signInWithGoogle() async {
    state = const AuthState.loading();
    final signUpWithGoogleResult =
        await ref.read(authRepositoryProvider).signInWithGoogle();
    _log.info('signInWithGoogle result: $signUpWithGoogleResult');
    state = signUpWithGoogleResult.when(
      ok: (value) {
        _log.info(
            'signInWithGoogle result: ${value.user?.email} - ${value.user?.createdAt}');
        return AuthState.authenticated(value);
      },
      error: (error) {
        _log.severe('signInWithGoogle result: Error', error);
        return AuthState.error(error);
      },
    );
  }

  Future<void> signInWithApple() async {
    state = const AuthState.loading();
    final signInWithAppleResult =
        await ref.read(authRepositoryProvider).signInWithApple();
    state = signInWithAppleResult.when(
      ok: (value) => AuthState.authenticated(null),
      error: (error) => AuthState.error(error),
    );
  }

  Future<void> signInWithEmail(String email, String password) async {
    state = const AuthState.loading();
    final signInWithEmailResult =
        await ref.read(authRepositoryProvider).signInWithEmail(email, password);
    state = signInWithEmailResult.when(
      ok: (value) => AuthState.authenticated(value),
      error: (error) => AuthState.error(error),
    );
  }

  Future<void> signOut() async {
    final signOutResult = await ref.read(authRepositoryProvider).signOut();
    state = signOutResult.when(
      ok: (value) {
        _log.info('signOut result: Success');
        return AuthState.unauthenticated();
      },
      error: (error) {
        _log.severe('signOut result: Error', error);
        return AuthState.error(error);
      },
    );
  }

  void isAuthenticated() {
    final isAuthenticated = ref.read(authRepositoryProvider).isAuthenticated();
    if (isAuthenticated) {
      state = const AuthState.authenticated(null);
    } else {
      state = const AuthState.unauthenticated();
    }
  }
}
