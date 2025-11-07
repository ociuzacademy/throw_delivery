// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';

class OTPActionButton extends StatelessWidget {
  const OTPActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    required this.colorScheme,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final OrderDetailsColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.backgroundColor,
          foregroundColor: colorScheme.textPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: label.isNotEmpty
            ? Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              )
            : Icon(icon, size: 20),
      ),
    );
  }
}
