import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:throw_delivery/core/exports/enum_exports.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';

class OrderInfoCard extends StatelessWidget {
  final OrderDetailsColorScheme colorScheme;
  final OrderDetailsResponsiveSizes responsiveSizes;
  final String orderId;
  final Timestamp pickupDate;
  final String pickupAddress;
  final Timestamp dropoffDate;
  final PreferedDeliveryTime preferedDeliveryTime;
  final String dropoffAddress;

  const OrderInfoCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.orderId,
    required this.pickupDate,
    required this.dropoffDate,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.preferedDeliveryTime,
  });

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    final DateFormat timeFormat = DateFormat('hh:mm a');
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
          // Order ID and Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order ID: #$orderId',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: colorScheme.textSecondaryColor,
                ),
              ),
              Text(
                dateFormat.format(pickupDate.toDate()),
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: colorScheme.textSecondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Timeline with addresses
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline dots and line
              Column(
                children: [
                  const SizedBox(height: 4),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 48,
                    color: colorScheme.dividerColor,
                    margin: const EdgeInsets.symmetric(vertical: 4),
                  ),
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),

              // Addresses
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Pickup Address
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pickup: $pickupAddress',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.textPrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          timeFormat.format(pickupDate.toDate()),
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: colorScheme.textSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Dropoff Address
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dropoff: $dropoffAddress',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.textPrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${timeFormat.format(dropoffDate.toDate())} ${preferedDeliveryTime.value}',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: colorScheme.textSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
