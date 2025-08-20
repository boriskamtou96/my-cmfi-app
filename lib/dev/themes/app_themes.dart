import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';

class AppThemes {
  const AppThemes._();

  static TextTheme get textThemeLight {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static TextTheme get textThemeDark {
    return TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: textThemeLight,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.red,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusXXXL),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing40,
            vertical: AppDimensions.spacing14,
          ),
          textStyle: GoogleFonts.poppins(
            fontSize: AppDimensions.fontSizeM,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimensions.radiusXXXL),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: AppDimensions.spacing40,
            vertical: AppDimensions.spacing16,
          ),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.white,
        brightness: Brightness.light,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      textTheme: textThemeDark,
      fontFamily: GoogleFonts.poppins().fontFamily,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.red,
          foregroundColor: AppColors.white,
        ),
      ),
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorDark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.black,
        brightness: Brightness.dark,
      ),
    );
  }
}

final appThmesProvider = Provider<ThemeData>((ref) {
  return AppThemes.lightTheme;
});
