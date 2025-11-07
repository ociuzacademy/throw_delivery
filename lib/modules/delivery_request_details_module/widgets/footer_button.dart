import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_color_scheme.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_responsive_sizes.dart';

class FooterButton extends StatelessWidget {
  final DeliveryRequestDetailsColorScheme colorScheme;
  final DeliveryRequestDetailsResponsiveSizes responsiveSizes;
  final VoidCallback onPressed;

  const FooterButton({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(responsiveSizes.horizontalPadding),
      decoration: BoxDecoration(
        color: colorScheme.secondaryColor,
        border: Border(
          top: BorderSide(color: colorScheme.accentColor, width: 1),
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primaryColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(
            vertical: responsiveSizes.buttonVerticalPadding,
            horizontal: 24,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          shadowColor: colorScheme.shadowColor,
        ),
        child: Text(
          'Place a Bid',
          style: GoogleFonts.inter(
            fontSize: responsiveSizes.bodyFontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
