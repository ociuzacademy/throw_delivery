// delivery_list_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';
import 'package:throw_delivery/core/widgets/custom_empty_widget.dart';
import 'package:throw_delivery/core/widgets/custom_error_widget.dart';
import 'package:throw_delivery/core/widgets/loaders/custom_loader_widget.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_color_scheme.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_responsive_sizes.dart';
import 'package:throw_delivery/modules/home_module/utils/delivery_list_widget_helper.dart';
import 'package:throw_delivery/modules/home_module/widgets/delivery_card.dart';

class DeliveryListWidget extends StatefulWidget {
  const DeliveryListWidget({super.key});

  @override
  State<DeliveryListWidget> createState() => _DeliveryListWidgetState();
}

class _DeliveryListWidgetState extends State<DeliveryListWidget> {
  late final DeliveryListWidgetHelper _deliveryListWidgetHelper;

  @override
  void initState() {
    super.initState();
    _deliveryListWidgetHelper = DeliveryListWidgetHelper(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _deliveryListWidgetHelper.getAgentDeliveryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    // Color scheme for light/dark mode
    final colorScheme = CompletedDeliveriesColorScheme(isDark);
    final responsiveSizes = CompletedDeliveriesResponsiveSizes(screenWidth);
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    final DateFormat timeFormat = DateFormat('hh:mm a');

    return Container(
      color: colorScheme.accentColor,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(responsiveSizes.horizontalPadding),
        child: Column(
          children: [
            SizedBox(height: responsiveSizes.verticalSpacing),

            // Pickup Status
            BlocBuilder<AgentDeliveryListCubit, AgentDeliveryListState>(
              builder: (context, state) {
                return switch (state) {
                  AgentDeliveryListInitial() => const SizedBox.shrink(),
                  AgentDeliveryListLoading() => const CustomLoaderWidget(
                    message: 'Loading agent delivery list...',
                  ),
                  AgentDeliveryListError(:final message) => CustomErrorWidget(
                    errorMessage: message,
                    isDark: isDark,
                    onRetry: _deliveryListWidgetHelper.getAgentDeliveryList,
                  ),
                  AgentDeliveryListEmpty() => CustomEmptyWidget(
                    message: 'No delivery requests found for the agent',
                    isDark: isDark,
                  ),
                  AgentDeliveryListLoaded() => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.deliveryRequests.length + 1,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: responsiveSizes.verticalSpacing),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  _deliveryListWidgetHelper
                                      .getAgentDeliveryList();
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: colorScheme.primaryColor,
                                ),
                                icon: const Icon(Icons.refresh, size: 20),
                                label: Text(
                                  'Refresh',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      final deliveryRequest = state.deliveryRequests[index - 1];
                      return DeliveryCard(
                        colorScheme: colorScheme,
                        responsiveSizes: responsiveSizes,
                        orderId: deliveryRequest.deliveryRequestId,
                        title:
                            '${deliveryRequest.packageType.value} - ${deliveryRequest.urgency.value}',
                        date: dateFormat.format(
                          deliveryRequest.pickupDate.toDate(),
                        ),
                        amount: deliveryRequest.agreedDeliveryCharge!,
                        status: deliveryRequest.deliveryStatus,
                        pickupTime: timeFormat.format(
                          deliveryRequest.pickupDate.toDate(),
                        ),
                      );
                    },
                  ),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
