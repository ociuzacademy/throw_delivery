import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_color_scheme.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_responsive_sizes.dart';

class MetricItem extends StatelessWidget {
  final DeliveryRequestDetailsColorScheme colorScheme;
  final DeliveryRequestDetailsResponsiveSizes responsiveSizes;
  final IconData icon;
  final String title;
  final String value;

  const MetricItem({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: colorScheme.primaryColor,
            size: responsiveSizes.largeIconSize,
          ),
          SizedBox(height: responsiveSizes.microSpacing),
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: responsiveSizes.smallFontSize,
              color: colorScheme.textLightColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: responsiveSizes.tinySpacing),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: responsiveSizes.bodyFontSize,
              fontWeight: FontWeight.bold,
              color: colorScheme.textDarkColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
