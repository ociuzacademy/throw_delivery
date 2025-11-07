import 'package:flutter/material.dart';

class OrderDetailsColorScheme {
  final bool isDark;

  OrderDetailsColorScheme(this.isDark);

  Color get primaryColor => const Color(0xFF00BFFF);
  Color get secondaryColor => isDark ? const Color(0xFF1E1E1E) : Colors.white;
  Color get backgroundColor =>
      isDark ? const Color(0xFF0F1C23) : const Color(0xFFF5F7F8);
  Color get accentColor =>
      isDark ? const Color(0xFF374151) : const Color(0xFFF1F5F9);
  Color get successColor => const Color(0xFF22C55E);
  Color get dangerColor => const Color(0xFFEF4444);
  Color get textPrimaryColor => isDark ? Colors.white : const Color(0xFF1F2937);
  Color get textSecondaryColor =>
      isDark ? Colors.grey[400]! : const Color(0xFF6B7280);
  Color get dividerColor =>
      isDark ? const Color(0xFF374151) : const Color(0xFFE5E7EB);
  Color get shadowColor => isDark
      ? Colors.black.withValues(alpha: 0.3)
      : Colors.black.withValues(alpha: 0.05);
}
