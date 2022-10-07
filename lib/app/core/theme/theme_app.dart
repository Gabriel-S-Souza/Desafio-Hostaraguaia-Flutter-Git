import 'package:flutter/material.dart';

class ThemeApp {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.blue,
      surfaceTint: AppColors.blue,
      secondary: AppColors.black,
      error: AppColors.error,
      background: AppColors.white,
      surface: AppColors.yellow,
      tertiary: AppColors.black,
      onSurface: AppColors.white,
      onBackground: AppColors.grey,
      onPrimary: AppColors.greyLight,
      onError: AppColors.error,
      onSecondary: AppColors.greyLight,
    ),
    primaryColor: AppColors.blue,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
    ),
  );
}

class AppColors {
  static const Color blue = Color(0xFF3977AA);
  static const Color black = Color(0xFF24292f);
  static const Color error = Color(0xFFF47853);
  static const Color white = Color(0xFFFFFFFF);
  static const Color yellow = Color(0xFFE19305);
  static const Color grey = Color(0xFF878787);
  static const Color greyLight = Color(0xFFB4B4B4);
}
