import 'package:flutter/material.dart';

class DeliveryRequestDetailsColorScheme {
  final bool isDark;

  DeliveryRequestDetailsColorScheme(this.isDark);

  Color get primaryColor => const Color(0xFF00BFFF);
  Color get secondaryColor => isDark ? const Color(0xFF1E1E1E) : Colors.white;
  Color get accentColor =>
      isDark ? const Color(0xFF2D2D2D) : const Color(0xFFF3F4F6);
  Color get successColor => const Color(0xFF22C55E);
  Color get dangerColor => const Color(0xFFEF4444);
  Color get textLightColor =>
      isDark ? Colors.grey[400]! : const Color(0xFF6B7280);
  Color get textDarkColor => isDark ? Colors.white : const Color(0xFF1F2937);
  Color get shadowColor => isDark
      ? Colors.black.withValues(alpha: 0.3)
      : Colors.black.withValues(alpha: 0.08);
}
