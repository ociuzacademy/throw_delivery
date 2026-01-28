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
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadowColor,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tracking Status',
            style: GoogleFonts.poppins(
              fontSize: 16,
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
                  final bool isPassed =
                      deliveryStatus == DeliveryStatus.onTheWay ||
                      deliveryStatus == DeliveryStatus.dropOff;
                  final bool isCurrent =
                      deliveryStatus == DeliveryStatus.pending;
                  final bool isActive = isPassed || isCurrent;

                  return TimelineItem(
                    colorScheme: colorScheme,
                    responsiveSizes: responsiveSizes,
                    icon: Icons.check,
                    iconColor: isActive
                        ? colorScheme.primaryColor
                        : colorScheme.dividerColor,
                    title: 'Order Accepted',
                    description: 'You have accepted the delivery request.',
                    titleColor: isActive
                        ? (isCurrent
                              ? colorScheme.primaryColor
                              : colorScheme.textPrimaryColor)
                        : colorScheme.textSecondaryColor,
                    showLine: true,
                    lineColor: isPassed
                        ? colorScheme.primaryColor
                        : colorScheme.dividerColor,
                  );
                },
              ),

              // Out for Delivery
              Builder(
                builder: (context) {
                  final bool isPassed =
                      deliveryStatus == DeliveryStatus.dropOff;
                  final bool isCurrent =
                      deliveryStatus == DeliveryStatus.onTheWay;
                  final bool isActive = isPassed || isCurrent;

                  return TimelineItem(
                    colorScheme: colorScheme,
                    responsiveSizes: responsiveSizes,
                    icon: Icons.local_shipping,
                    iconColor: isActive
                        ? Colors.green[500]!
                        : colorScheme.dividerColor,
                    title: 'Out for Delivery',
                    description: 'You are on the way to the dropoff location.',
                    titleColor: isActive
                        ? (isCurrent
                              ? Colors.green[500]!
                              : colorScheme.textPrimaryColor)
                        : colorScheme.textSecondaryColor,
                    showLine: true,
                    lineColor: isPassed
                        ? Colors.green[500]!
                        : colorScheme.dividerColor,
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
                    icon: Icons.check,
                    iconColor: isActive
                        ? colorScheme.successColor
                        : colorScheme.dividerColor,
                    title: 'Delivered',
                    description: 'Waiting for delivery completion.',
                    titleColor: isActive
                        ? colorScheme.successColor
                        : colorScheme.textSecondaryColor,
                    showLine: false,
                    lineColor: colorScheme.dividerColor,
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
