import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';

class TimelineItem extends StatelessWidget {
  final OrderDetailsColorScheme colorScheme;
  final OrderDetailsResponsiveSizes responsiveSizes;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;
  final Color titleColor;
  final bool showLine;
  final Color? lineColor;

  const TimelineItem({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.titleColor,
    required this.showLine,
    this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline icon and line
        Column(
          children: [
            Container(
              width: responsiveSizes.timelineIconSize,
              height: responsiveSizes.timelineIconSize,
              decoration: BoxDecoration(
                color: iconColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: responsiveSizes.iconSize * 0.7,
              ),
            ),
            if (showLine)
              Container(
                width: 1,
                height: 60,
                color: lineColor,
                margin: const EdgeInsets.symmetric(vertical: 2),
              ),
          ],
        ),
        SizedBox(width: responsiveSizes.mediumSpacing),

        // Content
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: responsiveSizes.largeSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: responsiveSizes.bodyFontSize,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
                SizedBox(height: responsiveSizes.smallSpacing),
                Text(
                  description,
                  style: GoogleFonts.inter(
                    fontSize: responsiveSizes.smallFontSize,
                    color: colorScheme.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
