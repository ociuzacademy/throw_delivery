import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/bidding_status_module/helpers/bidding_status_color_scheme.dart';
import 'package:throw_delivery/modules/bidding_status_module/helpers/bidding_status_responsive_sizes.dart';

class BargainCard extends StatelessWidget {
  final BiddingStatusColorScheme colorScheme;
  final BiddingStatusResponsiveSizes responsiveSizes;
  final double bargainAmount;
  final ValueNotifier<bool> isExpiredNotifier;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const BargainCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.bargainAmount,
    required this.isExpiredNotifier,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isExpiredNotifier,
      builder: (context, isExpired, child) {
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(responsiveSizes.cardPadding),
          decoration: BoxDecoration(
            color: colorScheme.secondaryColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: colorScheme.shadowColor,
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              // Bargain Amount
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Customer\'s Bargain Amount:',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.bodyFontSize,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.accentDarkColor,
                    ),
                  ),
                  Text(
                    '₹${bargainAmount.toStringAsFixed(2)}',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.priceFontSize,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Buttons Row
              Row(
                children: [
                  // Accept Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: isExpired ? null : onAccept,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isExpired
                            ? colorScheme.disabledColor
                            : colorScheme.statusGreen,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: responsiveSizes.screenHeight * 0.016,
                          horizontal: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: isExpired ? 0 : 4,
                        shadowColor: isExpired
                            ? Colors.transparent
                            : colorScheme.shadowColor,
                      ),
                      child: Text(
                        'Accept',
                        style: GoogleFonts.inter(
                          fontSize: responsiveSizes.bodyFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Reject Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: isExpired ? null : onReject,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isExpired
                            ? colorScheme.disabledColor
                            : colorScheme.statusRed,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: responsiveSizes.screenHeight * 0.016,
                          horizontal: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: isExpired ? 0 : 4,
                        shadowColor: isExpired
                            ? Colors.transparent
                            : colorScheme.shadowColor,
                      ),
                      child: Text(
                        'Reject',
                        style: GoogleFonts.inter(
                          fontSize: responsiveSizes.bodyFontSize,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
