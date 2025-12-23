// lib/widgets/personal_info.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/theme/app_colors.dart';
import 'package:throw_delivery/modules/home_module/widgets/info_item.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key, required this.email, required this.phone});
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Personal Information',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isDarkMode
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
              ),
            ),
            const SizedBox(height: 16),
            InfoItem(context: context, icon: Icons.email_outlined, text: email),
            if (phone.isNotEmpty) ...[
              const SizedBox(height: 16),
              InfoItem(
                context: context,
                icon: Icons.phone_outlined,
                text: phone,
              ),
            ],
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
