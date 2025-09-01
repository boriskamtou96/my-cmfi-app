import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app_colors.dart';
import 'app_dimensions.dart';

class AppThemes {
  const AppThemes._();

  static TextTheme get textThemeLight {
    return TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      bodyMedium: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      bodySmall: GoogleFonts.poppins(
        fontSize: 12,
        fontWeight: FontWeight.normal,
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
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.gray100,
        filled: true,
        suffixIconColor: AppColors.red,
        hintStyle: GoogleFonts.poppins(
          color: AppColors.secondaryBlue,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppDimensions.radiusL),
            bottomRight: Radius.circular(AppDimensions.radiusL),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppDimensions.radiusL),
            bottomRight: Radius.circular(AppDimensions.radiusL),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(AppDimensions.radiusL),
            bottomRight: Radius.circular(AppDimensions.radiusL),
          ),
        ),
      ),
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
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        elevation: 0,
        selectedItemColor: AppColors.red,
        unselectedItemColor: AppColors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
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
