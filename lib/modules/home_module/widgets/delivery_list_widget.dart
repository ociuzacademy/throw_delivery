// delivery_list_widget.dart
import 'package:flutter/material.dart';
import 'package:throw_delivery/modules/home_module/enums/delivery_status.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_color_scheme.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_responsive_sizes.dart';
import 'package:throw_delivery/modules/home_module/widgets/delivery_card.dart';

class DeliveryListWidget extends StatelessWidget {
  const DeliveryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    // Color scheme for light/dark mode
    final colorScheme = CompletedDeliveriesColorScheme(isDark);
    final responsiveSizes = CompletedDeliveriesResponsiveSizes(screenWidth);

    return Container(
      color: colorScheme.accentColor,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(responsiveSizes.horizontalPadding),
        child: Column(
          children: [
            SizedBox(height: responsiveSizes.verticalSpacing),

            // Pickup Status
            DeliveryCard(
              colorScheme: colorScheme,
              responsiveSizes: responsiveSizes,
              title: 'Office Documents',
              date: 'Today, 2:30 PM',
              amount: 750.00,
              rating: null,
              ratedBy: null,
              status: DeliveryStatus.pickup,
              pickupTime: 'Before 3:00 PM',
            ),
            SizedBox(height: responsiveSizes.verticalSpacing),

            // Ongoing Status
            DeliveryCard(
              colorScheme: colorScheme,
              responsiveSizes: responsiveSizes,
              title: 'Food Delivery',
              date: 'Today, 1:45 PM',
              amount: 450.00,
              rating: null,
              ratedBy: null,
              status: DeliveryStatus.ongoing,
              estimatedTime: '15 mins',
            ),
            SizedBox(height: responsiveSizes.verticalSpacing),

            // Completed Deliveries
            DeliveryCard(
              colorScheme: colorScheme,
              responsiveSizes: responsiveSizes,
              title: 'Package to Downtown',
              date: 'Jan 25, 2024',
              amount: 1250.00,
              rating: 5.0,
              ratedBy: 'John D.',
              status: DeliveryStatus.completed,
            ),
            SizedBox(height: responsiveSizes.verticalSpacing),

            DeliveryCard(
              colorScheme: colorScheme,
              responsiveSizes: responsiveSizes,
              title: 'Groceries Delivery',
              date: 'Jan 23, 2024',
              amount: 1875.50,
              rating: 4.8,
              ratedBy: 'Sarah W.',
              status: DeliveryStatus.completed,
            ),
            SizedBox(height: responsiveSizes.verticalSpacing),

            DeliveryCard(
              colorScheme: colorScheme,
              responsiveSizes: responsiveSizes,
              title: 'Canceled: Pizza Delivery',
              date: 'Jan 21, 2024',
              amount: 830.00,
              rating: null,
              ratedBy: null,
              status: DeliveryStatus.canceled,
            ),
            SizedBox(height: responsiveSizes.verticalSpacing),
          ],
        ),
      ),
    );
  }
}
