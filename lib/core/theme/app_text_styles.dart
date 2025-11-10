import 'package:flutter/material.dart';
import 'package:thothresearch_app/core/theme/app_colors.dart';

/// Typography styles matching the website
class AppTextStyles {
  AppTextStyles._();

  // Display styles (hero text)
  static const TextStyle displayLarge = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w800,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  // Headings
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.3,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle h5 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  static const TextStyle h6 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );

  // Body text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  // Button text
  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.5,
  );

  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 0.5,
  );

  // Caption/Labels
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.5,
  );

  // Overline (small uppercase text)
  static const TextStyle overline = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 1.4,
    letterSpacing: 1.5,
  );

  // Monospace (for device IDs, code)
  static const TextStyle mono = TextStyle(
    fontFamily: 'monospace',
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
}
