// lib/widgets/feedback_header.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/theme/app_colors.dart';

class FeedbackHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPressed;

  const FeedbackHeader({super.key, this.onBackPressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 16);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 4,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
      ),
      title: Text(
        'Feedback',
        style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
    );
  }
}
