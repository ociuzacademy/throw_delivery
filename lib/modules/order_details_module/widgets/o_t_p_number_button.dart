// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/typedefs/o_t_p_number_action.dart';

class OTPNumberButton extends StatelessWidget {
  final String number;
  final OrderDetailsColorScheme colorScheme;
  final OTPNumberAction onNumberPressed;
  const OTPNumberButton({
    super.key,
    required this.number,
    required this.colorScheme,
    required this.onNumberPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 50,
      child: ElevatedButton(
        onPressed: () => onNumberPressed(number),
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.backgroundColor,
          foregroundColor: colorScheme.textPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: Text(
          number,
          style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
