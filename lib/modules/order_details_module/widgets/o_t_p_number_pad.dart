// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';
import 'package:throw_delivery/modules/order_details_module/typedefs/o_t_p_number_action.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/o_t_p_action_button.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/o_t_p_number_button.dart';

class OTPNumberPad extends StatelessWidget {
  const OTPNumberPad({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.onNumberPressed,
    required this.clearOtp,
    required this.backspace,
  });

  final OrderDetailsColorScheme colorScheme;
  final OrderDetailsResponsiveSizes responsiveSizes;
  final OTPNumberAction onNumberPressed;
  final VoidCallback clearOtp;
  final VoidCallback backspace;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row 1: 1, 2, 3
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [1, 2, 3].map((number) {
            return OTPNumberButton(
              number: '$number',
              colorScheme: colorScheme,
              onNumberPressed: (number) => onNumberPressed(number),
            );
          }).toList(),
        ),
        SizedBox(height: responsiveSizes.smallSpacing),

        // Row 2: 4, 5, 6
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [4, 5, 6].map((number) {
            return OTPNumberButton(
              number: '$number',
              colorScheme: colorScheme,
              onNumberPressed: (number) => onNumberPressed(number),
            );
          }).toList(),
        ),
        SizedBox(height: responsiveSizes.smallSpacing),

        // Row 3: 7, 8, 9
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [7, 8, 9].map((number) {
            return OTPNumberButton(
              number: '$number',
              colorScheme: colorScheme,
              onNumberPressed: (number) => onNumberPressed(number),
            );
          }).toList(),
        ),
        SizedBox(height: responsiveSizes.smallSpacing),

        // Row 4: Clear, 0, Backspace
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OTPActionButton(
              label: 'CLEAR',
              icon: Icons.clear,
              onPressed: clearOtp,
              colorScheme: colorScheme,
            ),
            OTPNumberButton(
              number: '0',
              colorScheme: colorScheme,
              onNumberPressed: (_) => onNumberPressed('0'),
            ),
            OTPActionButton(
              label: '',
              icon: Icons.backspace,
              onPressed: backspace,
              colorScheme: colorScheme,
            ),
          ],
        ),
      ],
    );
  }
}
