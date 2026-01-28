import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/cubit/delivery_request/delivery_request_cubit.dart';
import 'package:throw_delivery/core/helper/location_helper.dart';
import 'package:throw_delivery/core/widgets/custom_error_widget.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_color_scheme.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_responsive_sizes.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/utils/delivery_request_details_helper.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/customer_info.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/widgets/delivery_request_address_section.dart';
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
        centerTitle: true,
        backgroundColor: colorScheme.primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
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
            DeliveryRequestDetailsLoaded(:final deliveryRequestDetails) =>
              SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(
                          responsiveSizes.horizontalPadding,
                        ),
                        child: Column(
                          children: [
                            // Customer Info Card
                            DetailCard(
                              colorScheme: colorScheme,
                              responsiveSizes: responsiveSizes,
                              child: CustomerInfo(
                                colorScheme: colorScheme,
                                responsiveSizes: responsiveSizes,
                                name: deliveryRequestDetails.customerName,
                                avatarUrl:
                                    deliveryRequestDetails.customerAvatarUrl,
                              ),
                            ),
                            SizedBox(height: responsiveSizes.mediumSpacing),

                            // Address Card
                            DetailCard(
                              colorScheme: colorScheme,
                              responsiveSizes: responsiveSizes,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      const SizedBox(height: 4),
                                      Icon(
                                        Icons.my_location,
                                        color: colorScheme.primaryColor,
                                        size: 20,
                                      ),
                                      Container(
                                        width: 2,
                                        height: 40,
                                        margin: const EdgeInsets.symmetric(
                                          vertical: 4,
                                        ),
                                        color: Colors.grey[100],
                                      ),
                                      Icon(
                                        Icons.location_on,
                                        color: colorScheme.dangerColor,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DeliveryRequestAddressSection(
                                          title: 'Pickup Address',
                                          address: deliveryRequestDetails
                                              .pickupAddress,
                                          phone: deliveryRequestDetails
                                              .pickupPhoneNumber,
                                          colorScheme: colorScheme,
                                          responsiveSizes: responsiveSizes,
                                        ),
                                        const SizedBox(height: 24),
                                        DeliveryRequestAddressSection(
                                          title: 'Drop-off Address',
                                          address: deliveryRequestDetails
                                              .dropOffAddress,
                                          phone: deliveryRequestDetails
                                              .dropOffPhoneNumber,
                                          colorScheme: colorScheme,
                                          responsiveSizes: responsiveSizes,
                                        ),
                                      ],
                                    ),
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
                                            deliveryRequestDetails
                                                .pickupLocation,
                                            deliveryRequestDetails
                                                .deliveryLocation,
                                          );
                                      return MetricItem(
                                        colorScheme: colorScheme,
                                        responsiveSizes: responsiveSizes,
                                        icon: Icons.social_distance,
                                        title: 'Distance',
                                        value:
                                            '${distance.toStringAsFixed(1)} km',
                                      );
                                    },
                                  ),
                                  MetricItem(
                                    colorScheme: colorScheme,
                                    responsiveSizes: responsiveSizes,
                                    icon: Icons.schedule,
                                    title: 'Time',
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
                            SizedBox(height: responsiveSizes.mediumSpacing),

                            // Package Details Card
                            DetailCard(
                              colorScheme: colorScheme,
                              responsiveSizes: responsiveSizes,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'PACKAGE DETAILS',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.textLightColor,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  if (deliveryRequestDetails.itemImageUrl !=
                                      null)
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: CachedNetworkImage(
                                          imageUrl: deliveryRequestDetails
                                              .itemImageUrl!,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              Container(
                                                color: Colors.grey[100],
                                              ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Package Remarks',
                                    style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: colorScheme.textDarkColor,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: colorScheme.accentColor.withValues(
                                        alpha: 0.3,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.grey[200]!,
                                      ),
                                    ),
                                    child: Text(
                                      deliveryRequestDetails.itemRemarks ??
                                          'No remarks provided.',
                                      style: GoogleFonts.inter(
                                        fontSize: 14,
                                        color: colorScheme.textDarkColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),

                    // Footer Button
                    FooterButton(
                      colorScheme: colorScheme,
                      responsiveSizes: responsiveSizes,
                      onPressed: () {
                        final DateTime auctionStartTime = deliveryRequestDetails
                            .auctionStartingTime
                            .toDate();
                        Navigator.push(
                          context,
                          PlaceBidPage.route(
                            deliveryRequestId: widget.deliveryRequestId,
                            baseBidAmount:
                                deliveryRequestDetails.baseDeliveryCharge,
                            currentMinBid:
                                deliveryRequestDetails.minimumDeliveryCharge,
                            auctionStartTime: auctionStartTime,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
