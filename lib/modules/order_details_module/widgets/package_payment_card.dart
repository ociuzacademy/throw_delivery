import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/exports/enum_exports.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';

class PackagePaymentCard extends StatelessWidget {
  final OrderDetailsColorScheme colorScheme;
  final OrderDetailsResponsiveSizes responsiveSizes;
  final PackageType packageType;
  final double weight;
  final double deliveryFee;
  final PaymentStatus paymentStatus;
  final String? itemImageUrl;
  final String? itemRemarks;

  const PackagePaymentCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.packageType,
    required this.weight,
    required this.deliveryFee,
    required this.paymentStatus,
    this.itemImageUrl,
    this.itemRemarks,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
              style: GoogleFonts.poppins(
                fontSize: 16,
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
                _buildPaymentInfoRow(
                  label: 'Item',
                  value: packageType.value,
                  colorScheme: colorScheme,
                ),
                const SizedBox(height: 16),
                _buildPaymentInfoRow(
                  label: 'Weight',
                  value: '$weight kg',
                  colorScheme: colorScheme,
                ),
                const SizedBox(height: 16),
                if (itemImageUrl != null) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Package Image',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.textSecondaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        width: 96,
                        height: 96,
                        child: CachedNetworkImage(
                          imageUrl: itemImageUrl!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              Container(color: colorScheme.accentColor),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                if (itemRemarks != null && itemRemarks!.isNotEmpty) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Package Remarks',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.textSecondaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: colorScheme.backgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: colorScheme.accentColor),
                    ),
                    child: Text(
                      itemRemarks!,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: colorScheme.textPrimaryColor.withValues(
                          alpha: 0.8,
                        ),
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
                Divider(color: colorScheme.dividerColor.withValues(alpha: 0.5)),
                const SizedBox(height: 8),
                _buildPaymentInfoRow(
                  label: 'Delivery Fee',
                  value: '₹$deliveryFee',
                  colorScheme: colorScheme,
                  valueBold: true,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment Status',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.textSecondaryColor,
                      ),
                    ),
                    Text(
                      paymentStatus.value,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
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

  Widget _buildPaymentInfoRow({
    required String label,
    required String value,
    required OrderDetailsColorScheme colorScheme,
    bool valueBold = true,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: colorScheme.textSecondaryColor,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: valueBold ? FontWeight.w600 : FontWeight.w500,
            color: colorScheme.textPrimaryColor,
          ),
        ),
      ],
    );
  }
}
