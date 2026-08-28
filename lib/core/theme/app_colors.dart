import 'package:flutter/material.dart';

abstract class AppColors {

  // Brand Colors
  static const Color primary = Color(0xFFfe9367);
  static const Color secondary = Color(0xFFFFCC80);

  // Light Theme Colors
  static const Color lightBackground = Color(0xFFFAF7E6); // Creamy warm white
  static const Color lightSurface = Color(0xFFE8F5E9);
  static const Color lightTextPrimary = Color(0xFF1E293B);
  static const Color lightTextSecondary = Color(0xFF64748B);

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF24130e);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color.fromARGB(255, 198, 212, 231);
}
