// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/view/delivery_request_details_page.dart';

class AuctionCard extends StatelessWidget {
  final String pickupAddress;
  final String dropoffAddress;
  final String price;
  final String? priority;
  final Color? priorityColor;
  final String itemType;
  final IconData itemIcon;
  final String distance;
  final bool isDark;
  final Color cardColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color primaryColor;
  const AuctionCard({
    super.key,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.price,
    this.priority,
    this.priorityColor,
    required this.itemType,
    required this.itemIcon,
    required this.distance,
    required this.isDark,
    required this.cardColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, DeliveryRequestDetailsPage.route());
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 24,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          children: [
            // Address and Price Section
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pickup',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: textSecondaryColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        pickupAddress,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: textPrimaryColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Drop-off',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: textSecondaryColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        dropoffAddress,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: textPrimaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      price,
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    if (priority != null) ...[
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: priorityColor!.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          priority!,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: priorityColor,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),

            // Divider
            Container(
              height: 1,
              margin: const EdgeInsets.symmetric(vertical: 12),
              color: isDark ? Colors.grey[700] : const Color(0xFFF3F4F6),
            ),

            // Item Type, Distance and Bid Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Item Type
                Row(
                  children: [
                    Icon(itemIcon, size: 16, color: textSecondaryColor),
                    const SizedBox(width: 8),
                    Text(
                      itemType,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: textSecondaryColor,
                      ),
                    ),
                  ],
                ),

                // Distance
                Row(
                  children: [
                    Icon(Icons.route, size: 16, color: textSecondaryColor),
                    const SizedBox(width: 8),
                    Text(
                      distance,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: textSecondaryColor,
                      ),
                    ),
                  ],
                ),

                // Bid Button
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Bid',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
