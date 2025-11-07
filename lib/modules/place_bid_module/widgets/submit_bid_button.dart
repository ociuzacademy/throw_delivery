import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/place_bid_module/helper/place_bid_color_scheme.dart';
import 'package:throw_delivery/modules/place_bid_module/helper/place_bid_responsive_sizes.dart';

class SubmitBidButton extends StatelessWidget {
  final PlaceBidColorScheme colorScheme;
  final PlaceBidResponsiveSizes responsiveSizes;
  final ValueNotifier<bool> isExpired;
  final VoidCallback onPressed;

  const SubmitBidButton({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.isExpired,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isExpired,
      builder: (context, isExpired, _) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isExpired ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: isExpired
                  ? colorScheme.disabledColor
                  : colorScheme.primaryColor,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: responsiveSizes.screenHeight * 0.018,
                horizontal: 24,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              shadowColor: colorScheme.shadowColor,
            ),
            child: Text(
              isExpired ? 'Auction Ended' : 'Submit Bid',
              style: GoogleFonts.inter(
                fontSize: responsiveSizes.bodyFontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      },
    );
  }
}
