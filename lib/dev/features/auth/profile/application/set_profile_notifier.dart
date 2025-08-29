import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/domain/user_profile_response.dart';
import '../../core/infrastructure/auth_repository.dart';

part 'set_profile_notifier.freezed.dart';

@freezed
abstract class SetProfileState with _$SetProfileState {
  const factory SetProfileState.initial() = _Initial;
  const factory SetProfileState.loading() = _Loading;
  const factory SetProfileState.loadedProfile(
      UserProfileResponse? userProfile) = _LoadedProfile;
  const factory SetProfileState.success(UserProfileResponse? userProfile) =
      _Success;
  const factory SetProfileState.error(String error) = _Error;
}

class SetProfileNotifier extends StateNotifier<SetProfileState> {
  final AuthRepository _authRepository;

  SetProfileNotifier(this._authRepository)
      : super(const SetProfileState.initial());

  Future<void> setProfile(UserProfileResponse userProfile) async {
    state = const SetProfileState.loading();
    final result = await _authRepository.setProfile(userProfile);
    state = result.when(
      ok: (value) => SetProfileState.success(userProfile),
      error: (error) => SetProfileState.error(error.toString()),
    );
  }

  Future<void> getProfile() async {
    state = const SetProfileState.loading();
    final result = await _authRepository.getProfile();
    state = result.when(
      ok: (value) => SetProfileState.loadedProfile(value),
      error: (error) => SetProfileState.error(error.toString()),
    );
  }
}

final setProfileNotifierProvider =
    StateNotifierProvider<SetProfileNotifier, SetProfileState>(
  (ref) => SetProfileNotifier(ref.watch(authRepositoryProvider)),
);
