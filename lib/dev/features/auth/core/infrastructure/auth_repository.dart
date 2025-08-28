import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../env.dart';
import '../../../core/infrastructure/result.dart';
import 'auth_local_service.dart';

typedef AuthResult = Result<AuthResponse>;

class AuthRepository {
  final SupabaseClient _supabase = Supabase.instance.client;
  final _logger = Logger("AuthRepository");

  final AuthLocalService _authLocalService;

  AuthRepository(this._authLocalService);

  Future<AuthResult> signInWithGoogle() async {
    try {
      final googleSignIn = GoogleSignIn(
        clientId: Env.iosGoogleAuthKey,
        serverClientId: Env.webGoogleAuthKey,
      );
      final googleAccount = await googleSignIn.signIn();
      final googleAuth = await googleAccount?.authentication;

      _authLocalService.saveUserFullName(googleAccount?.displayName ?? "");
      _authLocalService.saveUserProfilePicture(googleAccount?.photoUrl ?? "");
      _authLocalService.saveUserEmail(googleAccount?.email ?? "");

      final authResponse = await _supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: googleAuth?.idToken ?? "",
        accessToken: googleAuth?.accessToken ?? "",
      );
      return Result.ok(authResponse);
    } on AuthException catch (e) {
      return Result.error(e.message);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> signInWithApple() async {
    try {
      final authResponse = await _supabase.auth.signInWithOAuth(
        OAuthProvider.apple,
      );
      return Result.ok(authResponse);
    } on AuthException catch (e) {
      return Result.error(e.message);
    } on Exception catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<AuthResult> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final authResponse = await _supabase.auth.signInWithPassword(
        email: email.trim(),
        password: password.trim(),
      );
      _authLocalService.saveUserEmail(email);
      return Result.ok(authResponse);
    } on AuthException catch (e) {
      return Result.error(e.message);
    }
  }

  Future<AuthResult> signUpWithEmail(
    String email,
    String password,
  ) async {
    try {
      final authResponse = await _supabase.auth.signUp(
        email: email.trim(),
        password: password.trim(),
      );
      _authLocalService.saveUserEmail(email);
      return Result.ok(authResponse);
    } on AuthException catch (e) {
      return Result.error(e.message);
    }
  }

  Future<Result<void>> signOut() async {
    try {
      await _supabase.auth.signOut();
      _authLocalService.deleteUserData();
      _logger.info("User logged out");
      return Result.ok(null);
    } on AuthException catch (e) {
      return Result.error(e.message);
    }
  }

  bool isAuthenticated() =>
      _supabase.auth.currentUser != null &&
      _supabase.auth.currentSession != null;

  User? get currentUser => _supabase.auth.currentUser;

  Future<Result<void>> forgotPassword(String email) async {
    try {
      await _supabase.auth.resetPasswordForEmail(
        email,
        redirectTo: Env.supabaseUrl,
      );
      return Result.ok(null);
    } on AuthException catch (e) {
      return Result.error(e.message);
    }
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.read(authLocalServiceProvider));
});
