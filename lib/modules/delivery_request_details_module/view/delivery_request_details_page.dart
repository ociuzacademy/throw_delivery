import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_color_scheme.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_responsive_sizes.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/address_row.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/customer_info.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/delivery_request_details_page_divider.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/detail_card.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/footer_button.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/metric_item.dart';
import 'package:throw_delivery/modules/place_bid_module/view/place_bid_page.dart';

class DeliveryRequestDetailsPage extends StatelessWidget {
  const DeliveryRequestDetailsPage({super.key});

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => DeliveryRequestDetailsPage());

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Colors that adapt to light and dark mode
    final colorScheme = DeliveryRequestDetailsColorScheme(isDark);
    final responsiveSizes = DeliveryRequestDetailsResponsiveSizes(
      screenWidth,
      screenHeight,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Request Details',
          style: GoogleFonts.inter(
            fontSize: responsiveSizes.titleFontSize,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        backgroundColor: colorScheme.primaryColor,
        foregroundColor: Colors.white,
        elevation: 4,
        shadowColor: colorScheme.shadowColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(responsiveSizes.horizontalPadding),
              child: Column(
                children: [
                  SizedBox(height: responsiveSizes.smallSpacing),

                  // Customer Info Card
                  DetailCard(
                    colorScheme: colorScheme,
                    responsiveSizes: responsiveSizes,
                    child: CustomerInfo(
                      colorScheme: colorScheme,
                      responsiveSizes: responsiveSizes,
                      name: 'Rohan Sharma',
                      rating: '4.8 (120 reviews)',
                      avatarUrl:
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuAlMFGkIH9PH4TcBZSdVygNqE4nljQ81ZWZDjLw-qO9wsA2mFzmlJhgh7Bj76yCU-ebVEqu98PZzX9WM6HNcTy2mEshPwO92h8CXkbv__33L251xbY4tfymYGvDUTTiqJdaxN0LsR2MySt2E-tct-M5g9AIrjym_S2xaN-3rsFyvMTUfXnRqcL7sDVm0H5r-pnnjfqqJZ7IzACcpkwSbfdv6YpoV2Lv1iJxxJ2ct9ZicDbNq5gq_0NE1PH9ZpCMwDNv28WNE51cK64j',
                    ),
                  ),
                  SizedBox(height: responsiveSizes.mediumSpacing),

                  // Address Card
                  DetailCard(
                    colorScheme: colorScheme,
                    responsiveSizes: responsiveSizes,
                    child: Column(
                      children: [
                        AddressRow(
                          colorScheme: colorScheme,
                          responsiveSizes: responsiveSizes,
                          icon: Icons.my_location,
                          iconColor: colorScheme.primaryColor,
                          title: 'Pickup Address',
                          address: '123 Main Street, Koramangala, Bengaluru',
                          phone: '+91 98765 43210',
                        ),
                        SizedBox(height: responsiveSizes.smallSpacing),
                        const DeliveryRequestDetailsPageDivider(),
                        SizedBox(height: responsiveSizes.smallSpacing),
                        AddressRow(
                          colorScheme: colorScheme,
                          responsiveSizes: responsiveSizes,
                          icon: Icons.location_on,
                          iconColor: colorScheme.dangerColor,
                          title: 'Drop-off Address',
                          address: '456 Oak Avenue, HSR Layout, Bengaluru',
                          phone: '+91 87654 32109',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: responsiveSizes.mediumSpacing),

                  // Metrics Card
                  DetailCard(
                    colorScheme: colorScheme,
                    responsiveSizes: responsiveSizes,
                    child: Row(
                      children: [
                        MetricItem(
                          colorScheme: colorScheme,
                          responsiveSizes: responsiveSizes,
                          icon: Icons.social_distance,
                          title: 'Est. Distance',
                          value: '5.2 km',
                        ),
                        MetricItem(
                          colorScheme: colorScheme,
                          responsiveSizes: responsiveSizes,
                          icon: Icons.schedule,
                          title: 'Delivery Time',
                          value: 'Today, 3:00 PM',
                        ),
                        MetricItem(
                          colorScheme: colorScheme,
                          responsiveSizes: responsiveSizes,
                          icon: Icons.request_quote,
                          title: 'Base Bid',
                          value: '\u20B9200.00',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Footer Button
          FooterButton(
            colorScheme: colorScheme,
            responsiveSizes: responsiveSizes,
            onPressed: () {
              Navigator.push(context, PlaceBidPage.route(baseBidAmount: 200.0));
            },
          ),
        ],
      ),
    );
  }
}
