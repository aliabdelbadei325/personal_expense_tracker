import 'package:flutter/material.dart';

class AppTheme {

  static const Color primaryColor = Color(0xFF1C1C1E);
  static const Color secondaryColor = Color(0xFF2C2C2E);
  static const Color accentColor = Color(0xFF007AFF);
  static const Color accentHover = Color(0xFF0A84FF);

  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF98989D);
  static const Color textDisabled = Color(0xFF63636A);

  static const Color cardBackground = Color(0xFF3A3A3C);
  static const Color inputBackground = Color(0xFF48484A);
  static const Color borderColor = Color(0xFF63636A);

  static const Color successColor = Color(0xFF34C759);
  static const Color errorColor = Color(0xFFFF453A);
  static const Color warningColor = Color(0xFFFF9F0A);
  static const Color infoColor = Color(0xFF5AC8FA);

  static const List<Color> categoryColors = [
    Color(0xFFFF6B6B),
    Color(0xFF4ECDC4),
    Color(0xFF95E1D3),
    Color(0xFFF38181),
    Color(0xFFAA96DA),
    Color(0xFFFCBAD3),
    Color(0xFFA8D8EA),
    Color(0xFFFFD93D),
  ];

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: primaryColor,
    primaryColor: accentColor,


    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        fontFamily: 'Segoe UI',
      ),
      displayMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        fontFamily: 'Segoe UI',
      ),
      displaySmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        fontFamily: 'Segoe UI',
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        color: textPrimary,
        fontFamily: 'Segoe UI',
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: textSecondary,
        fontFamily: 'Segoe UI',
      ),
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: secondaryColor,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textPrimary,
        fontFamily: 'Segoe UI',
      ),
    ),


    cardTheme: CardThemeData(
      color: cardBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: inputBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: accentColor, width: 2),
      ),
      hintStyle: const TextStyle(color: textSecondary),
      labelStyle: const TextStyle(color: textSecondary),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accentColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'Segoe UI',
        ),
      ),
    ),
  );
}