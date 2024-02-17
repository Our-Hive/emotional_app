import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark() => ThemeData(
      colorScheme: const ColorScheme.dark(
        background: Color(0xFF1A1C27),
        primary: Color(0xFF57C877),
        onPrimary: Color(0xFF1A1C27),
        secondary: Color(0xFF191429),
        onSecondary: Color(0xFFFFFFFF),
        error: Color(0xFFF42A55),
        onError: Color(0xFFFFFFFF),
        surface: Color(0xFF191429),
        onSurface: Color(0xFFFFFFFF),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ));
}
