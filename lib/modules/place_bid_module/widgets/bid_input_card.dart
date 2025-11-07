import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/widgets/text_field/custom_text_field.dart';
import 'package:throw_delivery/modules/place_bid_module/helper/place_bid_color_scheme.dart';
import 'package:throw_delivery/modules/place_bid_module/helper/place_bid_responsive_sizes.dart';
import 'package:throw_delivery/modules/place_bid_module/utils/place_bid_helper.dart';

class BidInputCard extends StatelessWidget {
  final PlaceBidColorScheme colorScheme;
  final PlaceBidResponsiveSizes responsiveSizes;
  final TextEditingController bidAmountController;
  final ValueNotifier<bool> isExpired;
  final bool isDark;
  final PlaceBidHelper placeBidHelper;

  const BidInputCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.bidAmountController,
    required this.isExpired,
    required this.isDark,
    required this.placeBidHelper,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(responsiveSizes.largeCardPadding),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your bid amount',
            style: GoogleFonts.inter(
              fontSize: responsiveSizes.smallFontSize,
              fontWeight: FontWeight.w500,
              color: colorScheme.accentDarkColor,
            ),
          ),
          const SizedBox(height: 12),
          ValueListenableBuilder<bool>(
            valueListenable: isExpired,
            builder: (context, isExpired, _) {
              return Stack(
                children: [
                  CustomTextField(
                    controller: bidAmountController,
                    hintText: '0.00',
                    isDark: isDark,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    validator: placeBidHelper.validateBidAmount,
                    enabled: !isExpired,
                    textStyle: GoogleFonts.inter(
                      fontSize: responsiveSizes.bidInputFontSize,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.textColor,
                    ),
                    contentPadding: const EdgeInsets.only(
                      left: 32,
                      right: 16,
                      top: 16,
                      bottom: 16,
                    ),
                  ),
                  Positioned(
                    left: 12,
                    top: 0,
                    bottom: 0,
                    child: Center(
                      child: Text(
                        '₹',
                        style: GoogleFonts.inter(
                          fontSize: responsiveSizes.bodyFontSize,
                          color: colorScheme.accentDarkColor,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 8),
          Text(
            'Enter an amount less than or equal to the base price.',
            style: GoogleFonts.inter(
              fontSize: 12,
              color: colorScheme.accentDarkColor.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }
}
