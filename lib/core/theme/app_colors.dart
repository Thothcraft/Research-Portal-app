import 'package:flutter/material.dart';

/// Color palette matching the website design
class AppColors {
  AppColors._();

  // Primary colors - Indigo/Blue
  static const Color primary = Color(0xFF4F46E5); // indigo-600
  static const Color primaryLight = Color(0xFF6366F1); // indigo-500
  static const Color primaryDark = Color(0xFF4338CA); // indigo-700

  // Secondary colors - Purple/Pink
  static const Color secondary = Color(0xFFA855F7); // purple-500
  static const Color secondaryLight = Color(0xFFC084FC); // purple-400
  static const Color pink = Color(0xFFF472B6); // pink-400

  // Success
  static const Color success = Color(0xFF10B981); // green-500
  static const Color successLight = Color(0xFF34D399); // green-400

  // Warning
  static const Color warning = Color(0xFFF59E0B); // amber-500
  static const Color warningLight = Color(0xFFFBBF24); // amber-400

  // Error
  static const Color error = Color(0xFFEF4444); // red-500
  static const Color errorLight = Color(0xFFF87171); // red-400

  // Neutral - Light theme
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);

  // Dark theme backgrounds (from website gradients)
  static const Color darkBlue900 = Color(0xFF1E3A8A); // blue-900
  static const Color darkPurple900 = Color(0xFF581C87); // purple-900
  static const Color darkIndigo900 = Color(0xFF312E81); // indigo-900

  // Gradient colors
  static const List<Color> primaryGradient = [
    Color(0xFF3B82F6), // blue-500
    Color(0xFFA855F7), // purple-500
  ];

  static const List<Color> heroGradient = [
    Color(0xFF1E3A8A), // blue-900
    Color(0xFF581C87), // purple-900
    Color(0xFF312E81), // indigo-900
  ];

  static const List<Color> accentGradient = [
    Color(0xFFF472B6), // pink-400
    Color(0xFF818CF8), // indigo-400
  ];

  // Status colors
  static const Color online = Color(0xFF10B981); // green-500
  static const Color offline = Color(0xFF9CA3AF); // gray-400
  static const Color maintenance = Color(0xFFF59E0B); // amber-500

  // Chart colors
  static const List<Color> chartColors = [
    Color(0xFF3B82F6), // blue-500
    Color(0xFFA855F7), // purple-500
    Color(0xFFF472B6), // pink-400
    Color(0xFF10B981), // green-500
    Color(0xFFF59E0B), // amber-500
    Color(0xFF6366F1), // indigo-500
  ];

  // Shadow colors
  static const Color shadowLight = Color(0x1A000000); // 10% black
  static const Color shadowDark = Color(0x33000000); // 20% black
}
