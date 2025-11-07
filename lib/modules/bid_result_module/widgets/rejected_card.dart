// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RejectedCard extends StatelessWidget {
  final Color secondaryColor;
  final Color shadowColor;
  final double cardPadding;
  final Color dangerColor;
  final double screenWidth;
  final double largeFontSize;
  final Color textSecondaryColor;
  final double bodyFontSize;
  final Color textPrimaryColor;
  final String pickupAddress;
  final String dropoffAddress;
  final bool isDark;
  final double screenHeight;
  final double buttonFontSize;
  final VoidCallback onButtonClick;
  const RejectedCard({
    super.key,
    required this.secondaryColor,
    required this.shadowColor,
    required this.cardPadding,
    required this.dangerColor,
    required this.screenWidth,
    required this.largeFontSize,
    required this.textSecondaryColor,
    required this.bodyFontSize,
    required this.textPrimaryColor,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.isDark,
    required this.screenHeight,
    required this.buttonFontSize,
    required this.onButtonClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: shadowColor,
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // Cancel Icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: dangerColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.cancel,
              color: dangerColor,
              size: screenWidth < 360 ? 40 : 48,
            ),
          ),
          const SizedBox(height: 16),

          // Title
          Text(
            'Bid Rejected',
            style: GoogleFonts.poppins(
              fontSize: largeFontSize,
              fontWeight: FontWeight.w700,
              color: dangerColor,
            ),
          ),
          const SizedBox(height: 8),

          // Description
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.inter(
                fontSize: bodyFontSize,
                fontWeight: FontWeight.w400,
                color: textSecondaryColor,
                height: 1.5,
              ),
              children: [
                const TextSpan(
                  text: 'Unfortunately, your bid for the delivery from\n',
                ),
                TextSpan(
                  text: pickupAddress,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textPrimaryColor,
                  ),
                ),
                const TextSpan(text: ' to '),
                TextSpan(
                  text: dropoffAddress,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textPrimaryColor,
                  ),
                ),
                const TextSpan(text: ' was not accepted.'),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Find Other Deliveries Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onButtonClick,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDark
                    ? Colors.grey[700]
                    : const Color(0xFFE5E7EB),
                foregroundColor: textSecondaryColor,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.018,
                  horizontal: 32,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 0,
              ),
              child: Text(
                'Find Other Deliveries',
                style: GoogleFonts.inter(
                  fontSize: buttonFontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
