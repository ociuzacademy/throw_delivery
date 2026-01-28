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
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.primaryColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: colorScheme.primaryColor,
              size: responsiveSizes.iconSize,
            ),
          ),
          SizedBox(height: responsiveSizes.microSpacing),
          Text(
            title.toUpperCase(),
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: colorScheme.textLightColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: responsiveSizes.tinySpacing),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: responsiveSizes.smallFontSize,
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
