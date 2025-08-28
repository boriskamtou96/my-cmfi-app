import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../infrastructure/auth_repository.dart';

part 'auth_notifier.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(AuthResponse? user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(String error) = _Error;
  const factory AuthState.forgotPassword() = _ForgotPassword;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final _log = Logger('AuthNotifier');

  final AuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(const AuthState.initial());

  Future<void> signInWithGoogle() async {
    state = const AuthState.loading();
    final signUpWithGoogleResult = await _authRepository.signInWithGoogle();
    _log.info('signInWithGoogle result: $signUpWithGoogleResult');

    state = signUpWithGoogleResult.when(
      ok: (value) {
        _log.info(
            'signInWithGoogle result: ${value.user?.email} - ${value.user?.createdAt}');
        return AuthState.authenticated(value);
      },
      error: (error) {
        _log.severe('signInWithGoogle result: Error', error);
        return AuthState.error(error.toString());
      },
    );
  }

  Future<void> signInWithApple() async {
    state = const AuthState.loading();
    final signInWithAppleResult = await _authRepository.signInWithApple();

    state = signInWithAppleResult.when(
      ok: (value) => AuthState.authenticated(null),
      error: (error) => AuthState.error(error.toString()),
    );
  }

  Future<void> signInWithEmail(String email, String password) async {
    state = const AuthState.loading();
    final signInWithEmailResult =
        await _authRepository.signInWithEmail(email, password);
    state = signInWithEmailResult.when(
      ok: (value) {
        _log.info('signInWithEmail result: ${value.user?.email}');
        return AuthState.authenticated(value);
      },
      error: (error) {
        return AuthState.error(error.toString());
      },
    );
  }

  Future<void> signUpWithEmail(String email, String password) async {
    state = const AuthState.loading();
    final signUpWithEmailResult =
        await _authRepository.signUpWithEmail(email, password);
    state = signUpWithEmailResult.when(
      ok: (value) => AuthState.authenticated(value),
      error: (error) => AuthState.error(error.toString()),
    );
  }

  Future<void> forgotPassword(String email) async {
    state = const AuthState.loading();
    final forgotPasswordResult = await _authRepository.forgotPassword(email);
    state = forgotPasswordResult.when(
      ok: (value) => AuthState.forgotPassword(),
      error: (error) => AuthState.error(error.toString()),
    );
  }

  Future<void> signOut() async {
    final signOutResult = await _authRepository.signOut();
    state = signOutResult.when(
      ok: (value) {
        return AuthState.unauthenticated();
      },
      error: (error) {
        return AuthState.error(error.toString());
      },
    );
  }

  void isAuthenticated() {
    final isAuthenticated = _authRepository.isAuthenticated();
    if (isAuthenticated) {
      state = const AuthState.authenticated(null);
    } else {
      state = const AuthState.unauthenticated();
    }
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.watch(authRepositoryProvider)),
);
