import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/bidding_status_module/helpers/bidding_status_color_scheme.dart';
import 'package:throw_delivery/modules/bidding_status_module/helpers/bidding_status_responsive_sizes.dart';
import 'package:throw_delivery/modules/bidding_status_module/utils/bidding_status_helper.dart';

class CountdownCard extends StatelessWidget {
  final BiddingStatusColorScheme colorScheme;
  final BiddingStatusResponsiveSizes responsiveSizes;
  final ValueNotifier<int> totalSecondsNotifier;
  final ValueNotifier<bool> isExpiredNotifier;

  const CountdownCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.totalSecondsNotifier,
    required this.isExpiredNotifier,
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
      child: ValueListenableBuilder<bool>(
        valueListenable: isExpiredNotifier,
        builder: (context, isExpired, child) {
          return ValueListenableBuilder<int>(
            valueListenable: totalSecondsNotifier,
            builder: (context, totalSeconds, child) {
              return Column(
                children: [
                  Text(
                    'Auction ends in:',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.bodyFontSize,
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
                        BiddingStatusHelper.formattedTime(totalSeconds),
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
                        fontSize: responsiveSizes.bodyFontSize,
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
    );
  }
}
