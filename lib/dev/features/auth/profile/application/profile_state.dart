import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/domain/user_profile_response.dart';

final profileStateProvider = StateProvider<UserProfileResponse>((ref) {
  final supabase = Supabase.instance.client;
  return UserProfileResponse(
    email: supabase.auth.currentUser?.email,
    phoneNumber: supabase.auth.currentUser?.phone,
  );
});
