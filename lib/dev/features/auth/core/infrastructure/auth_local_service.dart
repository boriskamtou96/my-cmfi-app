import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/shared/providers.dart';

class AuthLocalService {
  final _userFullNameKey = 'user_full_name';
  final _userProfilePictureKey = 'user_profile_picture';

  final SharedPreferences _sharedPreferences;

  AuthLocalService(this._sharedPreferences);

  void saveUserFullName(String fullName) {
    _sharedPreferences.setString(_userFullNameKey, fullName);
  }

  String? getUserFullName() {
    return _sharedPreferences.getString(_userFullNameKey);
  }

  void saveUserProfilePicture(String profilePicture) {
    _sharedPreferences.setString(_userProfilePictureKey, profilePicture);
  }

  String? getUserProfilePicture() {
    return _sharedPreferences.getString(_userProfilePictureKey);
  }
}

final authLocalServiceProvider = Provider<AuthLocalService>((ref) {
  return AuthLocalService(ref.read(sharedPreferencesProvider));
});
