// ignore_for_file: public_member_api_docs, sort_constructors_first
// delivery_card.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/home_module/enums/delivery_status.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_color_scheme.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_responsive_sizes.dart';
import 'package:throw_delivery/modules/home_module/utils/delivery_card_helper.dart';

class OrderStatusBadge extends StatelessWidget {
  const OrderStatusBadge({
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
    final statusConfig = DeliveryCardHelper.getStatusConfig(
      status,
      colorScheme,
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: statusConfig.color.withValues(
          alpha: 0.1,
        ), // Use withOpacity instead of withValues
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        statusConfig.text,
        style: GoogleFonts.poppins(
          fontSize: responsiveSizes.smallFontSize,
          fontWeight: FontWeight.w500,
          color: statusConfig.color,
        ),
      ),
    );
  }
}
