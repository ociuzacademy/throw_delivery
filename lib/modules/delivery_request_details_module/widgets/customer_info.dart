import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_color_scheme.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_responsive_sizes.dart';

class CustomerInfo extends StatelessWidget {
  final DeliveryRequestDetailsColorScheme colorScheme;
  final DeliveryRequestDetailsResponsiveSizes responsiveSizes;
  final String name;
  final String avatarUrl;

  const CustomerInfo({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.name,
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
            border: Border.all(
              color: colorScheme.primaryColor.withValues(alpha: 0.1),
              width: 2,
            ),
            image: DecorationImage(
              image: CachedNetworkImageProvider(avatarUrl),
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
                  fontSize: responsiveSizes.bodyFontSize + 2,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.textDarkColor,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, size: 14, color: Colors.yellow[700]),
                  const SizedBox(width: 4),
                  Text(
                    '4.8',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.smallFontSize,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.textDarkColor,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '(120 reviews)',
                    style: GoogleFonts.inter(
                      fontSize: responsiveSizes.smallFontSize - 2,
                      color: colorScheme.textLightColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            // Chat functionality
          },
          icon: Icon(Icons.chat, color: colorScheme.primaryColor, size: 20),
          style: IconButton.styleFrom(
            backgroundColor: colorScheme.primaryColor.withValues(alpha: 0.1),
            padding: const EdgeInsets.all(8),
          ),
        ),
      ],
    );
  }
}
