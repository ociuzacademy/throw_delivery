// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/register_module/utils/register_helper.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final bool isDark;
  final double screenWidth;
  const SectionTitle({
    super.key,
    required this.title,
    required this.isDark,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.inter(
        fontSize: RegisterHelper.getSectionTitleFontSize(screenWidth),
        fontWeight: FontWeight.w600,
        color: isDark ? Colors.white : const Color(0xFF111827),
      ),
    );
  }
}
