// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';
import 'package:throw_delivery/core/helper/location_helper.dart';
import 'package:throw_delivery/core/widgets/custom_error_widget.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/view/delivery_request_details_page.dart';
import 'package:throw_delivery/modules/home_module/utils/auction_list_widget_helper.dart';
import 'package:throw_delivery/modules/home_module/widgets/auction_card.dart';

class AuctionListWidget extends StatefulWidget {
  const AuctionListWidget({super.key});

  @override
  State<AuctionListWidget> createState() => _AuctionListWidgetState();
}

class _AuctionListWidgetState extends State<AuctionListWidget> {
  late final AuctionListWidgetHelper _auctionListWidgetHelper;

  @override
  void initState() {
    super.initState();
    _auctionListWidgetHelper = AuctionListWidgetHelper(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _auctionListWidgetHelper.getActiveDeliveryRequests();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Colors for light and dark mode
    const primaryColor = Color(0xFF00BFFF);
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textPrimaryColor = isDark ? Colors.white : const Color(0xFF1F2937);
    final textSecondaryColor = isDark
        ? Colors.grey[400]!
        : const Color(0xFF6B7280);
    return BlocBuilder<ActiveDeliveryListCubit, ActiveDeliveryListState>(
      builder: (context, state) {
        return switch (state) {
          ActiveDeliveryListLoading() => const Center(
            child: CircularProgressIndicator(),
          ),
          ActiveDeliveryListEmpty() => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.inventory_2_outlined,
                  size: 80,
                  color: textSecondaryColor.withValues(alpha: 0.3),
                ),
                const SizedBox(height: 16),
                Text(
                  'No Active Requests',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: textPrimaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'There are no delivery requests at the moment.',
                  style: GoogleFonts.poppins(
                    color: textSecondaryColor.withValues(alpha: 0.3),
                  ),
                ),
              ],
            ),
          ),
          ActiveDeliveryListError(:final message) => CustomErrorWidget(
            errorMessage: message,
            isDark: isDark,
            onRetry: _auctionListWidgetHelper.getActiveDeliveryRequests,
          ),
          ActiveDeliveryListSuccess(:final activeDeliveryRequests) =>
            ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: activeDeliveryRequests.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            foregroundColor: primaryColor,
                          ),
                          icon: const Icon(Icons.filter_list, size: 20),
                          label: Text(
                            'Filter',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }

                final request = activeDeliveryRequests[index - 1];
                final distance = LocationHelper.calculateDistance(
                  request.pickupLocation,
                  request.deliveryLocation,
                );

                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: AuctionCard(
                    pickupAddress: request.pickupAddress,
                    dropoffAddress: request.dropOffAddress,
                    price: '₹${request.baseDeliveryCharge.toStringAsFixed(2)}',
                    urgency: request.urgency,
                    urgencyColor: request.urgency.color,
                    packageType: request.packageType,
                    itemIcon: request.packageType.icon,
                    distance: '${distance.toStringAsFixed(1)} km',
                    isDark: isDark,
                    cardColor: cardColor,
                    textPrimaryColor: textPrimaryColor,
                    textSecondaryColor: textSecondaryColor,
                    primaryColor: primaryColor,
                    onTap: () {
                      Navigator.push(
                        context,
                        DeliveryRequestDetailsPage.route(
                          deliveryRequestId: request.deliveryRequestId,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
