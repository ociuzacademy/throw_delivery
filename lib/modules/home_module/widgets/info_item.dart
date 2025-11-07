// lib/widgets/personal_info.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/theme/app_colors.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.context,
    required this.icon,
    required this.text,
  });

  final BuildContext context;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Icon(
          icon,
          color: isDarkMode
              ? AppColors.darkTextSecondary
              : AppColors.lightTextSecondary,
          size: 24,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: isDarkMode
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
