import 'package:flutter/material.dart';
import 'package:movies_app_task/core/themes/app_text.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: AppText.getTextTheme(true),
    scaffoldBackgroundColor: AppColors.darkColorScheme.surface,
    cardTheme: CardTheme(
      color: AppColors.darkColorScheme.surfaceContainerHighest,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkColorScheme.surface,
      foregroundColor: AppColors.darkColorScheme.onSurface,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: AppText.getTextTheme(false),
    scaffoldBackgroundColor: AppColors.lightColorScheme.surface,
    cardTheme: CardTheme(
      color: AppColors.lightColorScheme.surfaceContainerHighest,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightColorScheme.surface,
      foregroundColor: AppColors.lightColorScheme.onSurface,
    ),
  );
}
