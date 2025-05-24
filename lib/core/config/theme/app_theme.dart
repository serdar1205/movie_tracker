import 'package:flutter/material.dart';
import '../../constants/colors/app_colors.dart';

abstract class _LightColors {
  static const background = AppColors.backgroundLightColor;
  static const card = AppColors.cardLightColor;
}

abstract class _DarkColors {
  static const background = AppColors.backgroundDark;
  static const card = AppColors.cardDark;
}

abstract class AppTheme {
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  static ThemeData light() => ThemeData(
    brightness: Brightness.light,
    hintColor: AppColors.backgroundLightColor,
    visualDensity: visualDensity,
    appBarTheme: const AppBarTheme(
      backgroundColor:  AppColors.appBarLightColor,
      titleTextStyle: TextStyle(
          color: AppColors.textDarkColor,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      iconTheme: IconThemeData(color: AppColors.textDarkColor),
      elevation: 2,
    ),
    scaffoldBackgroundColor: _LightColors.background,
    cardColor: _LightColors.card,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purple, // Button color
        foregroundColor: Colors.white,      // Text/icon color
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          color: AppColors.deepPurple,
          fontSize: 22,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.purple),
      titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.purple),
      bodyLarge: TextStyle(
          fontSize: 18,
          letterSpacing: 1.5,
          height: 1.3,
          fontWeight: FontWeight.w400,
          color: AppColors.purple),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textDarkColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.textGrayColor,
      ),
    ),
  );

  static ThemeData dark() => ThemeData(
    brightness: Brightness.dark,
    hintColor: AppColors.backgroundDark,
    visualDensity: visualDensity,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarDark,
      titleTextStyle: TextStyle(
          color: AppColors.textLight,
          fontSize: 20,
          fontWeight: FontWeight.w600),
      iconTheme: IconThemeData(color: AppColors.textLight),
      elevation: 2,
    ),
    scaffoldBackgroundColor: _DarkColors.background,
    cardColor: _DarkColors.card,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purple, // Button color
        foregroundColor: Colors.white,      // Text/icon color
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          decorationThickness: 2,
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.textLight),
      titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textLight),
      titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textLight),
      bodyLarge: TextStyle(
          fontSize: 18,
          letterSpacing: 1.5,
          height: 1.3,
          fontWeight: FontWeight.w600,
          color: AppColors.white),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: AppColors.textLight,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textLight,
      ),
    ),
  );
}
