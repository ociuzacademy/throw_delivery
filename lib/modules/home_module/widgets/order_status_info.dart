// ignore_for_file: public_member_api_docs, sort_constructors_first
// delivery_card.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/exports/enum_exports.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_color_scheme.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_responsive_sizes.dart';

class OrderStatusInfo extends StatelessWidget {
  const OrderStatusInfo({
    super.key,
    required this.status,
    required this.colorScheme,
    required this.responsiveSizes,
  });

  final DeliveryStatus status;
  final CompletedDeliveriesColorScheme colorScheme;
  final CompletedDeliveriesResponsiveSizes responsiveSizes;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case DeliveryStatus.pending:
        return Row(
          children: [
            Icon(
              Icons.inventory_2, // Changed from package_2 to inventory_2
              color: colorScheme.infoColor,
              size: responsiveSizes.iconSize,
            ),
            const SizedBox(width: 4),
            Text(
              'Pending',
              style: GoogleFonts.poppins(
                fontSize: responsiveSizes.smallFontSize,
                color: colorScheme.textSecondaryColor,
              ),
            ),
          ],
        );
      case DeliveryStatus.onTheWay:
        return Row(
          children: [
            Icon(
              Icons.delivery_dining,
              color: colorScheme.warningColor,
              size: responsiveSizes.iconSize,
            ),
            const SizedBox(width: 4),
            Text(
              'On the way',
              style: GoogleFonts.poppins(
                fontSize: responsiveSizes.smallFontSize,
                color: colorScheme.textSecondaryColor,
              ),
            ),
          ],
        );
      case DeliveryStatus.dropOff:
        return Row(
          children: [
            Icon(
              Icons.cancel_outlined,
              color: colorScheme.dangerColor,
              size: responsiveSizes.iconSize,
            ),
            const SizedBox(width: 4),
            Text(
              'Drop Off',
              style: GoogleFonts.poppins(
                fontSize: responsiveSizes.smallFontSize,
                color: colorScheme.textSecondaryColor,
              ),
            ),
          ],
        );
    }
  }
}
