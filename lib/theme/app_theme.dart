import 'package:flutter/material.dart';

/// Central theme configuration for the portfolio app.
/// Contains colors, typography, and Material 3 design specifications.
/// This ensures consistent styling across all sections without hardcoded values.
class AppTheme {
  AppTheme._();

  // Dark theme colors
  static const Color _bgPrimary = Color(0xFF0F1419);
  static const Color _bgSecondary = Color(0xFF1A1F28);
  static const Color _accentColor = Color(0xFF00D4FF);
  static const Color _textPrimary = Color(0xFFFFFFFF);
  static const Color _textSecondary = Color(0xFFB0B0B0);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _bgPrimary,
      primaryColor: _accentColor,
      colorScheme: ColorScheme.dark(
        brightness: Brightness.dark,
        primary: _accentColor,
        surface: _bgSecondary,
        onSurface: _textPrimary,
        onPrimary: _bgPrimary,
      ),
      textTheme: _buildTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: _bgPrimary,
        elevation: 0,
        centerTitle: false,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _accentColor,
          foregroundColor: _bgPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _accentColor,
          side: const BorderSide(color: _accentColor, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: _bgSecondary,
        disabledColor: _bgSecondary,
        selectedColor: _accentColor,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        labelStyle: const TextStyle(
          color: _textPrimary,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
        brightness: Brightness.dark,
      ),
    );
  }

  /// Build responsive typography following Material 3 guidelines.
  static TextTheme _buildTextTheme() {
    return const TextTheme(
      // Large titles for hero section
      displayLarge: TextStyle(
        color: _textPrimary,
        fontSize: 48,
        fontWeight: FontWeight.bold,
        height: 1.2,
      ),
      displayMedium: TextStyle(
        color: _textPrimary,
        fontSize: 36,
        fontWeight: FontWeight.bold,
        height: 1.3,
      ),
      displaySmall: TextStyle(
        color: _textPrimary,
        fontSize: 28,
        fontWeight: FontWeight.bold,
        height: 1.4,
      ),
      // Headings for sections
      headlineSmall: TextStyle(
        color: _textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.bold,
        height: 1.4,
      ),
      // Body text
      bodyLarge: TextStyle(
        color: _textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.6,
      ),
      bodyMedium: TextStyle(
        color: _textSecondary,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        color: _textSecondary,
        fontSize: 12,
        fontWeight: FontWeight.normal,
      ),
      labelLarge: TextStyle(
        color: _accentColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Reusable spacing constants
  static const double spacingXS = 8.0;
  static const double spacingS = 12.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Max width for content on desktop
  static const double maxContentWidth = 1100.0;
}
