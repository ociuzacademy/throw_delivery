// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/bid_result_module/utils/bid_result_helper.dart';

import 'package:throw_delivery/modules/bid_result_module/widgets/accepted_card.dart';
import 'package:throw_delivery/modules/bid_result_module/widgets/rejected_card.dart';

class BidResultPage extends StatelessWidget {
  final bool isBidAccepted;
  final String pickupAddress;
  final String dropoffAddress;

  const BidResultPage({
    super.key,
    required this.isBidAccepted,
    this.pickupAddress = '123 Main St',
    this.dropoffAddress = '456 Oak Ave',
  });

  static MaterialPageRoute route({
    required bool isBidAccepted,
    String? pickupAddress,
    String? dropoffAddress,
  }) => MaterialPageRoute(
    builder: (context) => BidResultPage(
      isBidAccepted: isBidAccepted,
      pickupAddress: pickupAddress ?? '123 Main St',
      dropoffAddress: dropoffAddress ?? '456 Oak Ave',
    ),
  );

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Colors that adapt to light and dark mode
    final primaryColor = const Color(0xFF00BFFF);
    final secondaryColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final accentColor = isDark
        ? const Color(0xFF374151)
        : const Color(0xFFF3F4F6);
    final successColor = const Color(0xFF10B981);
    final dangerColor = const Color(0xFFEF4444);
    final textPrimaryColor = isDark ? Colors.white : const Color(0xFF1F2937);
    final textSecondaryColor = isDark
        ? Colors.grey[400]!
        : const Color(0xFF6B7280);
    final shadowColor = isDark
        ? Colors.black.withValues(alpha: 0.3)
        : Colors.black.withValues(alpha: 0.07);

    // Responsive sizing
    final horizontalPadding = screenWidth < 360 ? 16.0 : 24.0;
    final cardPadding = screenWidth < 360 ? 20.0 : 24.0;
    final titleFontSize = screenWidth < 360 ? 18.0 : 20.0;
    final bodyFontSize = screenWidth < 360 ? 14.0 : 16.0;
    final largeFontSize = screenWidth < 360 ? 20.0 : 24.0;
    final buttonFontSize = screenWidth < 360 ? 16.0 : 18.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bid Result',
          style: GoogleFonts.poppins(
            fontSize: titleFontSize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: primaryColor,
        elevation: 4,
        shadowColor: shadowColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Container(
          color: accentColor,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(horizontalPadding),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.1),

                // Conditional Card based on isBidAccepted
                if (isBidAccepted)
                  AcceptedCard(
                    secondaryColor: secondaryColor,
                    shadowColor: shadowColor,
                    cardPadding: cardPadding,
                    successColor: successColor,
                    screenWidth: screenWidth,
                    largeFontSize: largeFontSize,
                    textSecondaryColor: textSecondaryColor,
                    bodyFontSize: bodyFontSize,
                    textPrimaryColor: textPrimaryColor,
                    pickupAddress: pickupAddress,
                    dropoffAddress: dropoffAddress,
                    primaryColor: primaryColor,
                    screenHeight: screenHeight,
                    buttonFontSize: buttonFontSize,
                    onButtonClick: () =>
                        BidResultHelper.goToHomePage(context, isBidAccepted),
                  )
                else
                  RejectedCard(
                    secondaryColor: secondaryColor,
                    shadowColor: shadowColor,
                    cardPadding: cardPadding,
                    dangerColor: dangerColor,
                    screenWidth: screenWidth,
                    largeFontSize: largeFontSize,
                    textSecondaryColor: textSecondaryColor,
                    bodyFontSize: bodyFontSize,
                    textPrimaryColor: textPrimaryColor,
                    pickupAddress: pickupAddress,
                    dropoffAddress: dropoffAddress,
                    isDark: isDark,
                    screenHeight: screenHeight,
                    buttonFontSize: buttonFontSize,
                    onButtonClick: () =>
                        BidResultHelper.goToHomePage(context, isBidAccepted),
                  ),

                SizedBox(height: screenHeight * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
