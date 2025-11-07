// ignore_for_file: public_member_api_docs, sort_constructors_first
// delivery_card.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:throw_delivery/modules/home_module/enums/delivery_status.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_color_scheme.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_responsive_sizes.dart';
import 'package:throw_delivery/modules/home_module/utils/delivery_card_helper.dart';
import 'package:throw_delivery/modules/home_module/widgets/order_rating_section.dart';
import 'package:throw_delivery/modules/home_module/widgets/order_status_badge.dart';
import 'package:throw_delivery/modules/order_details_module/view/order_details_page.dart';

class DeliveryCard extends StatelessWidget {
  final CompletedDeliveriesColorScheme colorScheme;
  final CompletedDeliveriesResponsiveSizes responsiveSizes;
  final String title;
  final String date;
  final double amount;
  final double? rating;
  final String? ratedBy;
  final DeliveryStatus status;
  final String? pickupTime; // For pickup status
  final String? estimatedTime; // For ongoing status

  const DeliveryCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.title,
    required this.date,
    required this.amount,
    required this.rating,
    required this.ratedBy,
    required this.status,
    this.pickupTime,
    this.estimatedTime,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, OrderDetailsPage.route()),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(responsiveSizes.cardPadding),
        decoration: BoxDecoration(
          color: colorScheme.secondaryColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadowColor,
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            // Header Row
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                          fontSize: responsiveSizes.bodyFontSize,
                          fontWeight: FontWeight.w600,
                          color: colorScheme.textPrimaryColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        date,
                        style: GoogleFonts.poppins(
                          fontSize: responsiveSizes.smallFontSize,
                          color: colorScheme.textSecondaryColor,
                        ),
                      ),
                      // Additional info for pickup and ongoing statuses
                      if (status == DeliveryStatus.pickup &&
                          pickupTime != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          'Pickup: $pickupTime',
                          style: GoogleFonts.poppins(
                            fontSize: responsiveSizes.smallFontSize,
                            color: colorScheme.infoColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      if (status == DeliveryStatus.ongoing &&
                          estimatedTime != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          'ETA: $estimatedTime',
                          style: GoogleFonts.poppins(
                            fontSize: responsiveSizes.smallFontSize,
                            color: colorScheme.warningColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '₹${amount.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                    fontSize: responsiveSizes.amountFontSize,
                    fontWeight: FontWeight.w700,
                    color: DeliveryCardHelper.getAmountColor(
                      status,
                      colorScheme,
                    ),
                  ),
                ),
              ],
            ),

            // Divider
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              height: 1,
              color: colorScheme.accentColor,
            ),

            // Footer Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Rating Section - Only show for completed deliveries
                OrderRatingSection(
                  status: status,
                  colorScheme: colorScheme,
                  responsiveSizes: responsiveSizes,
                  rating: rating,
                  ratedBy: ratedBy,
                ),

                // Status Badge
                OrderStatusBadge(
                  status: status,
                  colorScheme: colorScheme,
                  responsiveSizes: responsiveSizes,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
