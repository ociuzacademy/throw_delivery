// completed_deliveries_color_scheme.dart
import 'package:flutter/material.dart';

class CompletedDeliveriesColorScheme {
  final bool isDark;

  CompletedDeliveriesColorScheme(this.isDark);

  Color get primaryColor => const Color(0xFF00BFFF);
  Color get secondaryColor => isDark ? const Color(0xFF1E1E1E) : Colors.white;
  Color get accentColor =>
      isDark ? const Color(0xFF121212) : const Color(0xFFF3F4F6);
  Color get textPrimaryColor => isDark ? Colors.white : const Color(0xFF1F2937);
  Color get textSecondaryColor =>
      isDark ? Colors.grey[400]! : const Color(0xFF6B7280);
  Color get successColor => const Color(0xFF10B981);
  Color get dangerColor => const Color(0xFFEF4444);
  Color get warningColor => const Color(0xFFF59E0B); // Orange for ongoing
  Color get infoColor => const Color(0xFF8B5CF6); // Purple for pickup
  Color get shadowColor => isDark
      ? Colors.black.withValues(alpha: 0.3)
      : Colors.black.withValues(alpha: 0.07);
}
