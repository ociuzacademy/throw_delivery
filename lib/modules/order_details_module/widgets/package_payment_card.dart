import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/exports/enum_exports.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/info_row.dart';

class PackagePaymentCard extends StatelessWidget {
  final OrderDetailsColorScheme colorScheme;
  final OrderDetailsResponsiveSizes responsiveSizes;
  final PackageType packageType;
  final double weight;
  final double deliveryFee;
  final PaymentStatus paymentStatus;

  const PackagePaymentCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.packageType,
    required this.weight,
    required this.deliveryFee,
    required this.paymentStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(responsiveSizes.cardPadding),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: colorScheme.dividerColor, width: 1),
              ),
            ),
            child: Text(
              'Package & Payment',
              style: GoogleFonts.inter(
                fontSize: responsiveSizes.bodyFontSize,
                fontWeight: FontWeight.w700,
                color: colorScheme.textPrimaryColor,
              ),
            ),
          ),

          // Content
          Padding(
            padding: EdgeInsets.all(responsiveSizes.cardPadding),
            child: Column(
              children: [
                InfoRow(
                  label: 'Item',
                  value: packageType.value,
                  colorScheme: colorScheme,
                  responsiveSizes: responsiveSizes,
                ),
                SizedBox(height: responsiveSizes.mediumSpacing),
                InfoRow(
                  label: 'Weight',
                  value: '$weight kg',
                  colorScheme: colorScheme,
                  responsiveSizes: responsiveSizes,
                ),
                SizedBox(height: responsiveSizes.mediumSpacing),
                InfoRow(
                  label: 'Delivery Fee',
                  value: '₹$deliveryFee',
                  colorScheme: colorScheme,
                  responsiveSizes: responsiveSizes,
                ),
                SizedBox(height: responsiveSizes.mediumSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment',
                      style: GoogleFonts.inter(
                        fontSize: responsiveSizes.bodyFontSize,
                        color: colorScheme.textSecondaryColor,
                      ),
                    ),
                    Text(
                      paymentStatus.value,
                      style: GoogleFonts.inter(
                        fontSize: responsiveSizes.bodyFontSize,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.successColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
