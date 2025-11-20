import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';
import 'package:throw_delivery/modules/order_details_module/utils/order_details_helper.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/customer_contact_card.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/order_info_card.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/package_payment_card.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/tracking_card.dart';

class OrderDetailsPage extends StatefulWidget {
  const OrderDetailsPage({super.key});

  static MaterialPageRoute route() => MaterialPageRoute(builder: (_) => const OrderDetailsPage());

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late final OrderDetailsHelper _orderDetailsHelper;

  @override
  void initState() {
    super.initState();
    _orderDetailsHelper = OrderDetailsHelper(context: context);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Color scheme for light/dark mode
    final colorScheme = OrderDetailsColorScheme(isDark);
    final responsiveSizes = OrderDetailsResponsiveSizes(
      screenWidth,
      screenHeight,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Details',
          style: GoogleFonts.inter(
            fontSize: responsiveSizes.titleFontSize,
            fontWeight: FontWeight.w700,
            color: colorScheme.textPrimaryColor,
          ),
        ),
        backgroundColor: colorScheme.secondaryColor,
        foregroundColor: colorScheme.textPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        color: colorScheme.backgroundColor,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(responsiveSizes.horizontalPadding),
                child: Column(
                  children: [
                    SizedBox(height: responsiveSizes.mediumSpacing),

                    // Order Info Card
                    OrderInfoCard(
                      colorScheme: colorScheme,
                      responsiveSizes: responsiveSizes,
                    ),
                    SizedBox(height: responsiveSizes.mediumSpacing),

                    // Package & Payment Card
                    PackagePaymentCard(
                      colorScheme: colorScheme,
                      responsiveSizes: responsiveSizes,
                    ),
                    SizedBox(height: responsiveSizes.mediumSpacing),

                    // Customer Contact Card
                    CustomerContactCard(
                      colorScheme: colorScheme,
                      responsiveSizes: responsiveSizes,
                    ),
                    SizedBox(height: responsiveSizes.mediumSpacing),

                    // Tracking Card
                    TrackingCard(
                      colorScheme: colorScheme,
                      responsiveSizes: responsiveSizes,
                    ),
                    SizedBox(height: responsiveSizes.largeSpacing),
                  ],
                ),
              ),
            ),

            // Footer Button
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(responsiveSizes.horizontalPadding),
              decoration: BoxDecoration(
                color: colorScheme.secondaryColor.withValues(alpha: 0.8),
                border: Border(
                  top: BorderSide(color: colorScheme.dividerColor, width: 1),
                ),
              ),
              child: ElevatedButton(
                onPressed: () {
                  _orderDetailsHelper.showOtpBottomSheet(
                    colorScheme,
                    responsiveSizes,
                  );
                },
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
                  shadowColor: colorScheme.primaryColor.withValues(alpha: 0.3),
                ),
                child: Text(
                  'Complete Delivery',
                  style: GoogleFonts.inter(
                    fontSize: responsiveSizes.bodyFontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
