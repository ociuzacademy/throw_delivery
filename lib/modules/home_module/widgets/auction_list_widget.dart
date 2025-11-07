// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/home_module/widgets/auction_card.dart';

class AuctionListWidget extends StatelessWidget {
  const AuctionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Colors for light and dark mode
    final primaryColor = const Color(0xFF00BFFF);
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textPrimaryColor = isDark ? Colors.white : const Color(0xFF1F2937);
    final textSecondaryColor = isDark
        ? Colors.grey[400]!
        : const Color(0xFF6B7280);
    final successColor = const Color(0xFF10B981);
    final dangerColor = const Color(0xFFEF4444);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Filter Button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {},
                style: TextButton.styleFrom(foregroundColor: primaryColor),
                icon: const Icon(Icons.filter_list, size: 20),
                label: Text(
                  'Filter',
                  style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Delivery Requests List
          Column(
            children: [
              AuctionCard(
                pickupAddress: '123 Main St, Springfield',
                dropoffAddress: '456 Oak Ave, Shelbyville',
                price: '\u20B915.00',
                priority: 'Urgent',
                priorityColor: successColor,
                itemType: 'Document',
                itemIcon: Icons.inventory_2,
                distance: '5.2 km',
                isDark: isDark,
                cardColor: cardColor,
                textPrimaryColor: textPrimaryColor,
                textSecondaryColor: textSecondaryColor,
                primaryColor: primaryColor,
              ),
              const SizedBox(height: 16),
              AuctionCard(
                pickupAddress: '789 Pine Ln, Capital City',
                dropoffAddress: '101 Maple Dr, Ogdenville',
                price: '\u20B925.00',
                priority: 'Low Priority',
                priorityColor: dangerColor,
                itemType: 'Food',
                itemIcon: Icons.lunch_dining,
                distance: '12.8 km',
                isDark: isDark,
                cardColor: cardColor,
                textPrimaryColor: textPrimaryColor,
                textSecondaryColor: textSecondaryColor,
                primaryColor: primaryColor,
              ),
              const SizedBox(height: 16),
              AuctionCard(
                pickupAddress: '246 Birch Rd, North Haverbrook',
                dropoffAddress: '357 Cedar Blvd, Brockway',
                price: '\u20B918.50',
                priority: null,
                priorityColor: null,
                itemType: 'Groceries',
                itemIcon: Icons.shopping_bag,
                distance: '8.1 km',
                isDark: isDark,
                cardColor: cardColor,
                textPrimaryColor: textPrimaryColor,
                textSecondaryColor: textSecondaryColor,
                primaryColor: primaryColor,
              ),
              const SizedBox(height: 16),
              AuctionCard(
                pickupAddress: '999 Elm Street, Metroville',
                dropoffAddress: '888 Oak Street, Smalltown',
                price: '\u20B932.00',
                priority: 'High Value',
                priorityColor: successColor,
                itemType: 'Electronics',
                itemIcon: Icons.computer,
                distance: '21.5 km',
                isDark: isDark,
                cardColor: cardColor,
                textPrimaryColor: textPrimaryColor,
                textSecondaryColor: textSecondaryColor,
                primaryColor: primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
