import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/providers.dart';

class SettingRepository {
  final SharedPreferences _sharedPreferences;

  SettingRepository(this._sharedPreferences);

  final _onboardingCompletedKey = 'onboarding_completed';
  final _letDoItCompletedKey = 'let_do_it_completed';
  final _profileCompletedKey = 'profile_completed';

  void setLetDoItCompleted() {
    _sharedPreferences.setBool(_letDoItCompletedKey, true);
  }

  bool isLetDoItCompleted() =>
      _sharedPreferences.getBool(_letDoItCompletedKey) ?? false;

  void setOnboardingCompleted() {
    _sharedPreferences.setBool(_onboardingCompletedKey, true);
  }

  bool isOnboardingCompleted() =>
      _sharedPreferences.getBool(_onboardingCompletedKey) ?? false;

  void setProfileCompleted() {
    _sharedPreferences.setBool(_profileCompletedKey, true);
  }

  bool isProfileCompleted() =>
      _sharedPreferences.getBool(_profileCompletedKey) ?? false;
}

final settingRepositoryProvider = Provider<SettingRepository>((ref) {
  return SettingRepository(ref.read(sharedPreferencesProvider));
});
