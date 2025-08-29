import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/domain/user_profile_response.dart';
import '../../core/infrastructure/auth_repository.dart';

part 'get_profile_notifier.g.dart';

@riverpod
Future<UserProfileResponse> getProfile(Ref ref) async {
  final authRepository = ref.watch(authRepositoryProvider);
  final result = await authRepository.getProfile();
  return result.when(
    ok: (value) => value,
    error: (error) => throw error,
  );
}
