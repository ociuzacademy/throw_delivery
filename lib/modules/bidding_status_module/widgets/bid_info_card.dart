import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/bidding_status_module/helpers/bidding_status_color_scheme.dart';
import 'package:throw_delivery/modules/bidding_status_module/helpers/bidding_status_responsive_sizes.dart';

class BidInfoCard extends StatelessWidget {
  final BiddingStatusColorScheme colorScheme;
  final BiddingStatusResponsiveSizes responsiveSizes;
  final double baseBidAmount;
  final double currentMinBid;
  final ValueNotifier<double> currentBidNotifier;

  const BidInfoCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.baseBidAmount,
    required this.currentMinBid,
    required this.currentBidNotifier,
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
      child: ValueListenableBuilder<double>(
        valueListenable: currentBidNotifier,
        builder: (context, currentBid, child) {
          return Column(
            children: [
              // Base Bid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Base Bid:',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.bodyFontSize,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.accentDarkColor,
                    ),
                  ),
                  Text(
                    '₹${baseBidAmount.toStringAsFixed(2)}',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.priceFontSize,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Divider
              Container(height: 1, color: colorScheme.accentLightColor),
              const SizedBox(height: 16),

              // Current Minimum Bid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Current Minimum Bid:',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.bodyFontSize,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.accentDarkColor,
                    ),
                  ),
                  Text(
                    '₹${currentMinBid.toStringAsFixed(2)}',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.priceFontSize,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.primaryColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Divider
              Container(height: 1, color: colorScheme.accentLightColor),
              const SizedBox(height: 16),

              // Your Bid
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Bid:',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.bodyFontSize,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.accentDarkColor,
                    ),
                  ),
                  Text(
                    '₹${currentBid.toStringAsFixed(2)}',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.priceFontSize,
                      fontWeight: FontWeight.w700,
                      color: colorScheme.statusGreen,
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
