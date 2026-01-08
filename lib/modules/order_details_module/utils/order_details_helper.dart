// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';

import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/o_t_p_bottom_sheet.dart';

class OrderDetailsHelper {
  final BuildContext context;
  final String orderId;
  const OrderDetailsHelper({required this.context, required this.orderId});

  void getDeliveryRequestDetails() {
    final DeliveryRequestDetailsCubit cubit = context
        .read<DeliveryRequestDetailsCubit>();
    cubit.getDeliveryRequestDetails(orderId);
  }

  void showOtpBottomSheet(
    OrderDetailsColorScheme colorScheme,
    OrderDetailsResponsiveSizes responsiveSizes,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => OTPBottomSheet(
        colorScheme: colorScheme,
        responsiveSizes: responsiveSizes,
        requestId: orderId,
      ),
    );
  }
}
