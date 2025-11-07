import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_color_scheme.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_responsive_sizes.dart';

class AddressRow extends StatelessWidget {
  final DeliveryRequestDetailsColorScheme colorScheme;
  final DeliveryRequestDetailsResponsiveSizes responsiveSizes;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String address;
  final String phone;

  const AddressRow({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.address,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: responsiveSizes.iconSize),
        SizedBox(width: responsiveSizes.horizontalGap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: responsiveSizes.smallFontSize,
                  color: colorScheme.textLightColor,
                ),
              ),
              SizedBox(height: responsiveSizes.tinySpacing),
              Text(
                address,
                style: GoogleFonts.inter(
                  fontSize: responsiveSizes.bodyFontSize,
                  fontWeight: FontWeight.w600,
                  color: colorScheme.textDarkColor,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: colorScheme.textLightColor,
                    size: 16,
                  ),
                  SizedBox(width: 4),
                  Text(
                    phone,
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.smallFontSize,
                      color: colorScheme.textLightColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
