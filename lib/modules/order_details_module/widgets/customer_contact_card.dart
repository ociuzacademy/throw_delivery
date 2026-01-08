import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';

class CustomerContactCard extends StatelessWidget {
  final OrderDetailsColorScheme colorScheme;
  final OrderDetailsResponsiveSizes responsiveSizes;
  final String customerName;
  final String customerPhone;
  final String customerImage;

  const CustomerContactCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.customerName,
    required this.customerPhone,
    required this.customerImage,
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
            'Customer Contact',
            style: GoogleFonts.inter(
              fontSize: responsiveSizes.bodyFontSize,
              fontWeight: FontWeight.w700,
              color: colorScheme.textPrimaryColor,
            ),
          ),
          SizedBox(height: responsiveSizes.mediumSpacing),
          Row(
            children: [
              Container(
                width: responsiveSizes.avatarSize,
                height: responsiveSizes.avatarSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    responsiveSizes.avatarSize / 2,
                  ),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(customerImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: responsiveSizes.mediumSpacing),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      customerName,
                      style: GoogleFonts.inter(
                        fontSize: responsiveSizes.bodyFontSize,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.textPrimaryColor,
                      ),
                    ),
                    SizedBox(height: responsiveSizes.smallSpacing),
                    Text(
                      customerPhone,
                      style: GoogleFonts.inter(
                        fontSize: responsiveSizes.smallFontSize,
                        color: colorScheme.textSecondaryColor,
                      ),
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
