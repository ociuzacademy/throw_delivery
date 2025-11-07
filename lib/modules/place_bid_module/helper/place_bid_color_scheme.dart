import 'package:flutter/material.dart';

class PlaceBidColorScheme {
  final bool isDark;

  PlaceBidColorScheme(this.isDark);

  Color get primaryColor => const Color(0xFF00BFFF);
  Color get secondaryColor => isDark ? const Color(0xFF1E1E1E) : Colors.white;
  Color get accentLightColor =>
      isDark ? const Color(0xFF2D2D2D) : const Color(0xFFE5E7EB);
  Color get accentDarkColor =>
      isDark ? Colors.grey[400]! : const Color(0xFF6B7280);
  Color get backgroundColor =>
      isDark ? const Color(0xFF121212) : const Color(0xFFF9FAFB);
  Color get statusGreen => const Color(0xFF22C55E);
  Color get statusRed => const Color(0xFFEF4444);
  Color get shadowColor => isDark
      ? Colors.black.withValues(alpha: 0.3)
      : Colors.black.withValues(alpha: 0.05);
  Color get textColor => isDark ? Colors.white : const Color(0xFF1F2937);
  Color get iconColor => isDark ? Colors.white : Colors.grey[700]!;
  Color get disabledColor => isDark ? Colors.grey[700]! : Colors.grey[400]!;
}
