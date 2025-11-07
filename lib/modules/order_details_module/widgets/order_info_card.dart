import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';

class OrderInfoCard extends StatelessWidget {
  final OrderDetailsColorScheme colorScheme;
  final OrderDetailsResponsiveSizes responsiveSizes;

  const OrderInfoCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
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
          // Order ID and Date
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order ID: #IND123456',
                style: GoogleFonts.inter(
                  fontSize: responsiveSizes.smallFontSize,
                  color: colorScheme.textSecondaryColor,
                ),
              ),
              Text(
                '24/05/2024',
                style: GoogleFonts.inter(
                  fontSize: responsiveSizes.smallFontSize,
                  color: colorScheme.textSecondaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: responsiveSizes.mediumSpacing),

          // Timeline with addresses
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Timeline dots and line
              Column(
                children: [
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
                    height: 40,
                    color: colorScheme.dividerColor,
                    margin: const EdgeInsets.symmetric(vertical: 2),
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
              SizedBox(width: responsiveSizes.mediumSpacing),

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
                          'Pickup: A-42, Connaught Place, New Delhi',
                          style: GoogleFonts.inter(
                            fontSize: responsiveSizes.bodyFontSize,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.textPrimaryColor,
                          ),
                        ),
                        SizedBox(height: responsiveSizes.smallSpacing),
                        Text(
                          '10:00 AM - 10:15 AM',
                          style: GoogleFonts.inter(
                            fontSize: responsiveSizes.smallFontSize,
                            color: colorScheme.textSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: responsiveSizes.largeSpacing),

                    // Dropoff Address
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dropoff: B-11, Sector 18, Noida',
                          style: GoogleFonts.inter(
                            fontSize: responsiveSizes.bodyFontSize,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.textPrimaryColor,
                          ),
                        ),
                        SizedBox(height: responsiveSizes.smallSpacing),
                        Text(
                          '11:00 AM - 11:15 AM',
                          style: GoogleFonts.inter(
                            fontSize: responsiveSizes.smallFontSize,
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
