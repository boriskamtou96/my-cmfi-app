import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared/providers.dart';

class SettingRepository {
  final SharedPreferences _sharedPreferences;

  SettingRepository(this._sharedPreferences);

  final _onboardingCompletedKey = 'onboarding_completed';

  void setOnboardingCompleted() {
    _sharedPreferences.setBool(_onboardingCompletedKey, true);
  }

  bool get isOnboardingCompleted {
    return _sharedPreferences.getBool(_onboardingCompletedKey) ?? false;
  }
}

final settingRepositoryProvider = Provider<SettingRepository>((ref) {
  return SettingRepository(ref.read(sharedPreferencesProvider));
});
