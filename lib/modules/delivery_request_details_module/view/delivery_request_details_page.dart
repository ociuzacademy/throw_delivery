import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/cubit/delivery_request/delivery_request_cubit.dart';
import 'package:throw_delivery/core/helper/location_helper.dart';
import 'package:throw_delivery/core/widgets/custom_error_widget.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_color_scheme.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_responsive_sizes.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/utils/delivery_request_details_helper.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/address_row.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/customer_info.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/delivery_request_details_page_divider.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/detail_card.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/footer_button.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/metric_item.dart';
import 'package:throw_delivery/modules/place_bid_module/view/place_bid_page.dart';

class DeliveryRequestDetailsPage extends StatefulWidget {
  final String deliveryRequestId;
  const DeliveryRequestDetailsPage({
    super.key,
    required this.deliveryRequestId,
  });

  static MaterialPageRoute route({required String deliveryRequestId}) =>
      MaterialPageRoute(
        builder: (_) =>
            DeliveryRequestDetailsPage(deliveryRequestId: deliveryRequestId),
      );

  @override
  State<DeliveryRequestDetailsPage> createState() =>
      _DeliveryRequestDetailsPageState();
}

class _DeliveryRequestDetailsPageState
    extends State<DeliveryRequestDetailsPage> {
  late final DeliveryRequestDetailsHelper _deliveryRequestDetailsHelper;
  @override
  void initState() {
    super.initState();
    _deliveryRequestDetailsHelper = DeliveryRequestDetailsHelper(
      context: context,
      requestId: widget.deliveryRequestId,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _deliveryRequestDetailsHelper.getDeliveryRequestDetails();
    });
  }

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
      body: BlocBuilder<DeliveryRequestCubit, DeliveryRequestState>(
        builder: (context, state) {
          return switch (state) {
            DeliveryRequestInitial() => const SizedBox.shrink(),
            DeliveryRequestLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
            DeliveryRequestError(:final message) => CustomErrorWidget(
              errorMessage: message,
              isDark: isDark,
              onRetry: _deliveryRequestDetailsHelper.getDeliveryRequestDetails,
            ),
            DeliveryRequestDetailsLoaded(:final deliveryRequestDetails) => Column(
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
                            name: deliveryRequestDetails.customerName,
                            avatarUrl: deliveryRequestDetails.customerAvatarUrl,
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
                                address: deliveryRequestDetails.pickupAddress,
                                phone: deliveryRequestDetails.pickupPhoneNumber,
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
                                address: deliveryRequestDetails.dropOffAddress,
                                phone:
                                    deliveryRequestDetails.dropOffPhoneNumber,
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
                              Builder(
                                builder: (context) {
                                  final distance =
                                      LocationHelper.calculateDistance(
                                        deliveryRequestDetails.pickupLocation,
                                        deliveryRequestDetails.deliveryLocation,
                                      );
                                  return MetricItem(
                                    colorScheme: colorScheme,
                                    responsiveSizes: responsiveSizes,
                                    icon: Icons.social_distance,
                                    title: 'Est. Distance',
                                    value: '${distance.toStringAsFixed(2)} km',
                                  );
                                },
                              ),
                              MetricItem(
                                colorScheme: colorScheme,
                                responsiveSizes: responsiveSizes,
                                icon: Icons.schedule,
                                title: 'Delivery Time',
                                value: deliveryRequestDetails
                                    .preferredDeliveryTime
                                    .value,
                              ),
                              MetricItem(
                                colorScheme: colorScheme,
                                responsiveSizes: responsiveSizes,
                                icon: Icons.request_quote,
                                title: 'Base Bid',
                                value:
                                    '\u20B9${deliveryRequestDetails.baseDeliveryCharge.toStringAsFixed(2)}',
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
                    Navigator.push(
                      context,
                      PlaceBidPage.route(
                        baseBidAmount:
                            deliveryRequestDetails.baseDeliveryCharge,
                      ),
                    );
                  },
                ),
              ],
            ),
          };
        },
      ),
    );
  }
}
