import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: ".env")
abstract class Env {
  @EnviedField(varName: 'SUPABASE_PROJECT', obfuscate: true)
  static final String supabaseProject = _Env.supabaseProject;

  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static final String supabaseUrl = _Env.supabaseUrl;

  @EnviedField(varName: 'SUPABASE_ANON', obfuscate: true)
  static final String supabaseAnon = _Env.supabaseAnon;

  @EnviedField(varName: 'IOS_GOOGLE_AUTH_KEY', obfuscate: true)
  static final String iosGoogleAuthKey = _Env.iosGoogleAuthKey;

  @EnviedField(varName: 'WEB_GOOGLE_AUTH_KEY', obfuscate: true)
  static final String webGoogleAuthKey = _Env.webGoogleAuthKey;
}
