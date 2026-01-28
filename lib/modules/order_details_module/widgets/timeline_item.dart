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
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: iconColor,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 14),
            ),
            if (showLine) Container(width: 2, height: 48, color: lineColor),
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
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
                SizedBox(height: responsiveSizes.smallSpacing),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
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
