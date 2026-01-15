import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/exports/enum_exports.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/timeline_item.dart';

class TrackingCard extends StatelessWidget {
  final OrderDetailsColorScheme colorScheme;
  final OrderDetailsResponsiveSizes responsiveSizes;
  final DeliveryStatus deliveryStatus;

  const TrackingCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.deliveryStatus,
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
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tracking',
            style: GoogleFonts.inter(
              fontSize: responsiveSizes.bodyFontSize,
              fontWeight: FontWeight.w700,
              color: colorScheme.textPrimaryColor,
            ),
          ),
          SizedBox(height: responsiveSizes.mediumSpacing),

          // Timeline
          Column(
            children: [
              // Order Accepted
              Builder(
                builder: (context) {
                  final bool isActive =
                      deliveryStatus == DeliveryStatus.pending ||
                      deliveryStatus == DeliveryStatus.onTheWay ||
                      deliveryStatus == DeliveryStatus.dropOff;
                  return TimelineItem(
                    colorScheme: colorScheme,
                    responsiveSizes: responsiveSizes,
                    icon: Icons.check_circle,
                    iconColor: isActive
                        ? colorScheme.successColor
                        : colorScheme.secondaryColor,
                    title: 'Order Accepted',
                    description: 'You have accepted the delivery request.',
                    titleColor: isActive
                        ? colorScheme.successColor
                        : colorScheme.secondaryColor,
                    showLine: isActive,
                    lineColor: isActive
                        ? colorScheme.successColor
                        : colorScheme.secondaryColor,
                  );
                },
              ),

              // Out for Delivery
              Builder(
                builder: (context) {
                  final bool isActive =
                      deliveryStatus == DeliveryStatus.onTheWay ||
                      deliveryStatus == DeliveryStatus.dropOff;
                  return TimelineItem(
                    colorScheme: colorScheme,
                    responsiveSizes: responsiveSizes,
                    icon: Icons.local_shipping,
                    iconColor: isActive
                        ? colorScheme.successColor
                        : colorScheme.secondaryColor,
                    title: 'Out for Delivery',
                    description: 'You are on the way to the dropoff location.',
                    titleColor: isActive
                        ? colorScheme.successColor
                        : colorScheme.secondaryColor,
                    showLine: isActive,
                    lineColor: isActive
                        ? colorScheme.successColor
                        : colorScheme.secondaryColor,
                  );
                },
              ),

              // Delivered
              Builder(
                builder: (context) {
                  final bool isActive =
                      deliveryStatus == DeliveryStatus.dropOff;
                  return TimelineItem(
                    colorScheme: colorScheme,
                    responsiveSizes: responsiveSizes,
                    icon: Icons.inventory_2,
                    iconColor: isActive
                        ? colorScheme.successColor
                        : colorScheme.secondaryColor,
                    title: 'Delivered',
                    description: 'Waiting for delivery completion.',
                    titleColor: isActive
                        ? colorScheme.successColor
                        : colorScheme.secondaryColor,
                    showLine: false,
                    lineColor: isActive
                        ? colorScheme.successColor
                        : colorScheme.secondaryColor,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
