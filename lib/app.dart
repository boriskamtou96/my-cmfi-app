import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toastification/toastification.dart';

import 'dev/i18n/strings.g.dart';
import 'dev/routing/router.dart';
import 'dev/themes/app_themes.dart';
import 'dev/utils/scroll_behavior.dart';

final appInitializationProvider = FutureProvider<void>((ref) async {
  await Future.delayed(const Duration(seconds: 5));
  log('App initialization completed');
});

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appInitializationProvider, (previous, next) {});
    final router = ref.watch(routerProvider);
    return ToastificationWrapper(
      config: ToastificationConfig(
        maxTitleLines: 1,
        maxDescriptionLines: 3,
        animationDuration: const Duration(milliseconds: 600),
        alignment: Alignment.bottomCenter,
      ),
      child: MaterialApp.router(
        title: t.app_title,
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        scrollBehavior: AppCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: router,
      ),
    );
  }
}
