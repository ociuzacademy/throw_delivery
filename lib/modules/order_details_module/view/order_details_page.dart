import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';
import 'package:throw_delivery/core/exports/enum_exports.dart';
import 'package:throw_delivery/core/widgets/custom_error_widget.dart';
import 'package:throw_delivery/core/widgets/loaders/custom_loader_widget.dart';
import 'package:throw_delivery/core/widgets/loaders/overlay_loader.dart';
import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_delivery/modules/home_module/view/home_page.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';
import 'package:throw_delivery/modules/order_details_module/utils/order_details_helper.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/customer_contact_card.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/order_info_card.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/package_payment_card.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/tracking_card.dart';

class OrderDetailsPage extends StatefulWidget {
  final String orderId;
  const OrderDetailsPage({super.key, required this.orderId});

  static MaterialPageRoute route({required String orderId}) =>
      MaterialPageRoute(builder: (_) => OrderDetailsPage(orderId: orderId));

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  late final OrderDetailsHelper _orderDetailsHelper;

  @override
  void initState() {
    super.initState();
    _orderDetailsHelper = OrderDetailsHelper(
      context: context,
      orderId: widget.orderId,
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _orderDetailsHelper.getDeliveryRequestDetails();
    });
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
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: colorScheme.textPrimaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: colorScheme.backgroundColor.withValues(alpha: 0.8),
        foregroundColor: colorScheme.textPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: BlocListener<CompleteDeliveryBloc, CompleteDeliveryState>(
        listener: (context, state) {
          switch (state) {
            case CompleteDeliveryLoading():
              OverlayLoader.show(context, message: 'Verifying OTP...');
              break;
            case CompleteDeliverySuccess():
              OverlayLoader.hide();
              CustomSnackbar.showSuccess(
                context: context,
                message: 'OTP verified successfully',
              );
              Navigator.pushAndRemoveUntil(
                context,
                HomePage.route(),
                (_) => false,
              );
              break;
            case CompleteDeliveryError(:final message):
              OverlayLoader.hide();
              CustomSnackbar.showError(context: context, message: message);
              break;
            default:
              OverlayLoader.hide();
              break;
          }
        },
        child:
            BlocBuilder<
              DeliveryRequestDetailsCubit,
              DeliveryRequestDetailsState
            >(
              builder: (context, state) {
                return switch (state) {
                  DeliveryRequestDetailsInitial() => const SizedBox.shrink(),
                  DeliveryRequestDetailsLoading() => const CustomLoaderWidget(
                    message: 'Loading delivery request details...',
                  ),
                  DeliveryRequestDetailsError(:final message) =>
                    CustomErrorWidget(
                      errorMessage: message,
                      isDark: isDark,
                      onRetry: _orderDetailsHelper.getDeliveryRequestDetails,
                    ),
                  DeliveryRequestDetailsSuccess(:final deliveryRequest) =>
                    SafeArea(
                      child: Container(
                        color: colorScheme.backgroundColor,
                        child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                padding: EdgeInsets.all(
                                  responsiveSizes.horizontalPadding,
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: responsiveSizes.mediumSpacing,
                                    ),

                                    // Order Info Card
                                    OrderInfoCard(
                                      colorScheme: colorScheme,
                                      responsiveSizes: responsiveSizes,
                                      orderId: widget.orderId,
                                      pickupDate: deliveryRequest.pickupDate,
                                      pickupAddress:
                                          deliveryRequest.pickupAddress,
                                      dropoffDate: deliveryRequest.dropOffDate,
                                      preferedDeliveryTime:
                                          deliveryRequest.preferredDeliveryTime,
                                      dropoffAddress:
                                          deliveryRequest.dropOffAddress,
                                    ),
                                    SizedBox(
                                      height: responsiveSizes.mediumSpacing,
                                    ),

                                    // Package & Payment Card
                                    PackagePaymentCard(
                                      colorScheme: colorScheme,
                                      responsiveSizes: responsiveSizes,
                                      packageType: deliveryRequest.packageType,
                                      weight: deliveryRequest.packageWeight,
                                      deliveryFee:
                                          deliveryRequest
                                              .agreedDeliveryCharge ??
                                          0.0,
                                      paymentStatus:
                                          deliveryRequest.paymentStatus,
                                      itemImageUrl:
                                          deliveryRequest.itemImageUrl,
                                      itemRemarks: deliveryRequest.itemRemarks,
                                    ),
                                    SizedBox(
                                      height: responsiveSizes.mediumSpacing,
                                    ),

                                    // Customer Contact Card
                                    CustomerContactCard(
                                      colorScheme: colorScheme,
                                      responsiveSizes: responsiveSizes,
                                      customerName:
                                          deliveryRequest.customerName,
                                      customerPhone:
                                          deliveryRequest.pickupPhoneNumber,
                                      customerImage:
                                          deliveryRequest.customerAvatarUrl,
                                    ),
                                    SizedBox(
                                      height: responsiveSizes.mediumSpacing,
                                    ),

                                    // Tracking Card
                                    TrackingCard(
                                      colorScheme: colorScheme,
                                      responsiveSizes: responsiveSizes,
                                      deliveryStatus:
                                          deliveryRequest.deliveryStatus,
                                    ),
                                    SizedBox(
                                      height: responsiveSizes.largeSpacing,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Footer Button
                            deliveryRequest.deliveryStatus ==
                                    DeliveryStatus.onTheWay
                                ? Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 24,
                                      vertical: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      color: colorScheme.secondaryColor
                                          .withValues(alpha: 0.95),
                                      border: Border(
                                        top: BorderSide(
                                          color: colorScheme.dividerColor,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    child: ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        maxWidth: 400,
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          _orderDetailsHelper
                                              .showOtpBottomSheet(
                                                colorScheme,
                                                responsiveSizes,
                                              );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              colorScheme.primaryColor,
                                          foregroundColor: Colors.white,
                                          minimumSize: const Size(
                                            double.infinity,
                                            52,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          elevation: 8,
                                          shadowColor: colorScheme.primaryColor
                                              .withValues(alpha: 0.3),
                                        ),
                                        child: Text(
                                          'Complete Delivery',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                };
              },
            ),
      ),
    );
  }
}
