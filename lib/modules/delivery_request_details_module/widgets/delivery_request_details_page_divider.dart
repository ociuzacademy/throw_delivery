import 'package:flutter/material.dart';

class DeliveryRequestDetailsPageDivider extends StatelessWidget {
  const DeliveryRequestDetailsPageDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final accentColor = isDark
        ? const Color(0xFF2D2D2D)
        : const Color(0xFFF3F4F6);

    return Divider(color: accentColor, height: 1);
  }
}
