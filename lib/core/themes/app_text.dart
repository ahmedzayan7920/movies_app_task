import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppText {
  static TextTheme getTextTheme(bool isDark) {
    return TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: isDark ? AppColors.white : AppColors.grey,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: isDark ? AppColors.white : AppColors.grey,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: isDark ? AppColors.white : AppColors.grey,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: isDark ? AppColors.white : AppColors.grey,
      ),
    );
  }
}
