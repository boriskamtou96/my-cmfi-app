import 'package:flutter/material.dart';

import '../../i18n/strings.g.dart';

extension BuildContextExtensions on BuildContext {
  Locale get t => TranslationProvider.of(this).flutterLocale;
}
