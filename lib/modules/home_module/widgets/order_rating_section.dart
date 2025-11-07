// ignore_for_file: public_member_api_docs, sort_constructors_first
// delivery_card.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/home_module/enums/delivery_status.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_color_scheme.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_responsive_sizes.dart';
import 'package:throw_delivery/modules/home_module/widgets/order_status_info.dart';

class OrderRatingSection extends StatelessWidget {
  const OrderRatingSection({
    super.key,
    required this.status,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.rating,
    required this.ratedBy,
  });

  final DeliveryStatus status;
  final CompletedDeliveriesColorScheme colorScheme;
  final CompletedDeliveriesResponsiveSizes responsiveSizes;
  final double? rating;
  final String? ratedBy;

  @override
  Widget build(BuildContext context) {
    // Only show ratings for completed deliveries
    if (status != DeliveryStatus.completed) {
      return OrderStatusInfo(
        status: status,
        colorScheme: colorScheme,
        responsiveSizes: responsiveSizes,
      );
    }

    if (rating == null) {
      return Row(
        children: [
          Icon(
            Icons.star_outline,
            color: colorScheme.textSecondaryColor,
            size: responsiveSizes.iconSize,
          ),
          const SizedBox(width: 4),
          Text(
            'No Rating',
            style: GoogleFonts.poppins(
              fontSize: responsiveSizes.smallFontSize,
              fontWeight: FontWeight.w500,
              color: colorScheme.textPrimaryColor,
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Icon(
          Icons.star,
          color: colorScheme.successColor,
          size: responsiveSizes.iconSize,
        ),
        const SizedBox(width: 4),
        Text(
          rating!.toStringAsFixed(1),
          style: GoogleFonts.poppins(
            fontSize: responsiveSizes.smallFontSize,
            fontWeight: FontWeight.w500,
            color: colorScheme.textPrimaryColor,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '(by $ratedBy)',
          style: GoogleFonts.poppins(
            fontSize: responsiveSizes.smallFontSize,
            color: colorScheme.textSecondaryColor,
          ),
        ),
      ],
    );
  }
}
