import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';

class InfoRow extends StatelessWidget {
  final OrderDetailsColorScheme colorScheme;
  final OrderDetailsResponsiveSizes responsiveSizes;
  final String label;
  final String value;

  const InfoRow({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: responsiveSizes.bodyFontSize,
            color: colorScheme.textSecondaryColor,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: responsiveSizes.bodyFontSize,
            fontWeight: FontWeight.w500,
            color: colorScheme.textPrimaryColor,
          ),
        ),
      ],
    );
  }
}
