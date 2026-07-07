import 'package:flutter/material.dart';

/// Shared constants for the premium game UI.
abstract class AppConstants {
  static const Color primaryPurple = Color(0xFF7C4DFF);
  static const Color primaryPink = Color(0xFFFF5DA2);
  static const Color primaryCyan = Color(0xFF25C7FF);
  static const Color gold = Color(0xFFFFC857);
  static const Color emerald = Color(0xFF22C55E);
  static const Color coral = Color(0xFFFF6B6B);
  static const Color deepNavy = Color(0xFF0F172A);
  static const Color midnight = Color(0xFF111827);
  static const Color slate = Color(0xFF334155);
  static const Color cardSurface = Color(0xCCFFFFFF);
  static const Color cardSurfaceDark = Color(0xCC18212F);

  static const double radiusLg = 24;
  static const double radiusMd = 18;
  static const double radiusSm = 14;
  static const double spacingXs = 8;
  static const double spacingSm = 12;
  static const double spacingMd = 16;
  static const double spacingLg = 24;
  static const double spacingXl = 32;

  static const List<Color> royalGradient = [
    primaryPurple,
    primaryPink,
    primaryCyan,
  ];
}
