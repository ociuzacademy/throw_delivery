// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AcceptedCard extends StatelessWidget {
  final Color secondaryColor;
  final Color shadowColor;
  final double cardPadding;
  final Color successColor;
  final double screenWidth;
  final double largeFontSize;
  final Color textSecondaryColor;
  final double bodyFontSize;
  final Color textPrimaryColor;
  final String pickupAddress;
  final String dropoffAddress;
  final Color primaryColor;
  final double screenHeight;
  final double buttonFontSize;
  final VoidCallback onButtonClick;
  const AcceptedCard({
    super.key,
    required this.secondaryColor,
    required this.shadowColor,
    required this.cardPadding,
    required this.successColor,
    required this.screenWidth,
    required this.largeFontSize,
    required this.textSecondaryColor,
    required this.bodyFontSize,
    required this.textPrimaryColor,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.primaryColor,
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
          // Success Icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: successColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_circle,
              color: successColor,
              size: screenWidth < 360 ? 40 : 48,
            ),
          ),
          const SizedBox(height: 16),

          // Title
          Text(
            'Bid Accepted!',
            style: GoogleFonts.poppins(
              fontSize: largeFontSize,
              fontWeight: FontWeight.w700,
              color: successColor,
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
                const TextSpan(text: 'Your bid for the delivery from\n'),
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
                const TextSpan(text: ' has been accepted.'),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Delivery Assigned Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onButtonClick,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.018,
                  horizontal: 32,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 4,
                shadowColor: shadowColor,
              ),
              child: Text(
                'Delivery Assigned',
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
