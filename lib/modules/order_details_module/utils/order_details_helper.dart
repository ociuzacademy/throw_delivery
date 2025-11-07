// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/o_t_p_bottom_sheet.dart';

class OrderDetailsHelper {
  final BuildContext context;
  const OrderDetailsHelper({required this.context});

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
      ),
    );
  }
}
