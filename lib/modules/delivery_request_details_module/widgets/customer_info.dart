import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_color_scheme.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_responsive_sizes.dart';

class CustomerInfo extends StatelessWidget {
  final DeliveryRequestDetailsColorScheme colorScheme;
  final DeliveryRequestDetailsResponsiveSizes responsiveSizes;
  final String name;
  final String rating;
  final String avatarUrl;

  const CustomerInfo({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.name,
    required this.rating,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: responsiveSizes.avatarSize,
          height: responsiveSizes.avatarSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(responsiveSizes.avatarSize / 2),
            image: DecorationImage(
              image: NetworkImage(avatarUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: responsiveSizes.horizontalGap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.inter(
                  fontSize: responsiveSizes.bodyFontSize,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.textDarkColor,
                ),
              ),
              SizedBox(height: responsiveSizes.tinySpacing),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow[700], size: 16),
                  SizedBox(width: responsiveSizes.tinyHorizontalGap),
                  Flexible(
                    child: Text(
                      rating,
                      style: GoogleFonts.inter(
                        fontSize: responsiveSizes.smallFontSize,
                        color: colorScheme.textLightColor,
                      ),
                      overflow: TextOverflow.ellipsis,
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
