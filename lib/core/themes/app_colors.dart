import 'package:flutter/material.dart';

abstract class AppColors {
  static ColorScheme darkColorScheme = ColorScheme.dark(
    primary: white,
    onPrimary: grey,
    secondary: greyLight,
    onSecondary: black,
    surface: const Color(0xFF121212),
    onSurface: white,
    surfaceContainerHighest: const Color(0xFF1E1E1E),
    onSurfaceVariant: greyLight,
    error: redLight,
    onError: white,
  );

  static ColorScheme lightColorScheme = ColorScheme.light(
    primary: grey,
    onPrimary: white,
    secondary: greyLight,
    onSecondary: black,
    surface: white,
    onSurface: grey,
    surfaceContainerHighest: greyLight,
    onSurfaceVariant: grey,
    error: redLight,
    onError: white,
  );

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(0xFF757575);
  static final Color greyLight = Colors.grey[350]!;
  static const Color green = Colors.green;
  static final Color redLight = Colors.red.shade300;
  static final Color yellow = Colors.yellow[800]!;
}
