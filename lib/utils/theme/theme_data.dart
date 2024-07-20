import 'package:flutter/material.dart';

ThemeData customTheme = ThemeData(
  useMaterial3: true,
  primaryColor: Colors.blue,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600
    ),

    titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600
    ),
    bodyLarge: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
      fontSize: 12,
    ),
    displaySmall: TextStyle(
      fontSize: 8,
    ),
  ),
);
