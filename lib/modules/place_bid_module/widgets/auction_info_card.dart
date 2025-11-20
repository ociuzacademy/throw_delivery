import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/place_bid_module/helper/place_bid_color_scheme.dart';
import 'package:throw_delivery/modules/place_bid_module/helper/place_bid_responsive_sizes.dart';
import 'package:throw_delivery/modules/place_bid_module/utils/place_bid_helper.dart';

class AuctionInfoCard extends StatelessWidget {
  final PlaceBidColorScheme colorScheme;
  final PlaceBidResponsiveSizes responsiveSizes;
  final double basePrice;
  final double currentMinBid;
  final ValueNotifier<int> totalSeconds;
  final ValueNotifier<bool> isExpired;

  const AuctionInfoCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.basePrice,
    required this.currentMinBid,
    required this.totalSeconds,
    required this.isExpired,
  });

  @override
  Widget build(BuildContext context) {
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
          // Price Info Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Base Price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Base Price',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.smallFontSize,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.accentDarkColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹ ${basePrice.toStringAsFixed(0)}',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.priceFontSize,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.textColor,
                    ),
                  ),
                ],
              ),
              // Current Min Bid
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Current Min Bid',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.smallFontSize,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.accentDarkColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₹ ${currentMinBid.toStringAsFixed(0)}',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.priceFontSize,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.statusGreen,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Countdown Timer
          ValueListenableBuilder<bool>(
            valueListenable: isExpired,
            builder: (context, isExpired, _) {
              return ValueListenableBuilder<int>(
                valueListenable: totalSeconds,
                builder: (context, totalSeconds, _) {
                  return Column(
                    children: [
                      Text(
                        'Auction ends in:',
                        style: GoogleFonts.inter(
                          fontSize: responsiveSizes.smallFontSize,
                          fontWeight: FontWeight.w500,
                          color: colorScheme.accentDarkColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            PlaceBidHelper.formatTime(totalSeconds),
                            style: GoogleFonts.inter(
                              fontSize: responsiveSizes.countdownFontSize,
                              fontWeight: FontWeight.w700,
                              color: isExpired
                                  ? colorScheme.disabledColor
                                  : colorScheme.primaryColor,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'min',
                            style: GoogleFonts.inter(
                              fontSize: responsiveSizes.bodyFontSize,
                              fontWeight: FontWeight.w600,
                              color: isExpired
                                  ? colorScheme.disabledColor
                                  : colorScheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      if (isExpired) ...[
                        const SizedBox(height: 8),
                        Text(
                          'Auction has ended',
                          style: GoogleFonts.inter(
                            fontSize: responsiveSizes.smallFontSize,
                            fontWeight: FontWeight.w500,
                            color: colorScheme.statusRed,
                          ),
                        ),
                      ],
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
