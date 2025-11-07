// o_t_p_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_color_scheme.dart';
import 'package:throw_delivery/modules/order_details_module/helper/order_details_responsive_sizes.dart';
import 'package:throw_delivery/modules/order_details_module/utils/o_t_p_bottom_sheet_helper.dart';
import 'package:throw_delivery/modules/order_details_module/widgets/o_t_p_number_pad.dart';

class OTPBottomSheet extends StatefulWidget {
  final OrderDetailsColorScheme colorScheme;
  final OrderDetailsResponsiveSizes responsiveSizes;

  const OTPBottomSheet({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
  });

  @override
  State<OTPBottomSheet> createState() => _OTPBottomSheetState();
}

class _OTPBottomSheetState extends State<OTPBottomSheet> {
  late final OTPBottomSheetHelper _otpBottomSheetHelper;
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _otpFocusNodes = List.generate(
    4,
    (index) => FocusNode(),
  );
  final ValueNotifier<List<String>> _enteredOtp = ValueNotifier([
    '',
    '',
    '',
    '',
  ]);

  @override
  void initState() {
    super.initState();
    _otpBottomSheetHelper = OTPBottomSheetHelper(
      context: context,
      otpControllers: _otpControllers,
      otpFocusNodes: _otpFocusNodes,
      enteredOtp: _enteredOtp,
    );
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _otpFocusNodes) {
      focusNode.dispose();
    }
    _enteredOtp.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(widget.responsiveSizes.horizontalPadding),
      decoration: BoxDecoration(
        color: widget.colorScheme.secondaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: widget.colorScheme.dividerColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Title
          Text(
            'Enter OTP',
            style: GoogleFonts.inter(
              fontSize: widget.responsiveSizes.titleFontSize,
              fontWeight: FontWeight.w700,
              color: widget.colorScheme.textPrimaryColor,
            ),
          ),

          SizedBox(height: widget.responsiveSizes.smallSpacing),

          // Description
          Text(
            'Please enter the 4-digit OTP provided by the customer',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              fontSize: widget.responsiveSizes.bodyFontSize,
              color: widget.colorScheme.textSecondaryColor,
            ),
          ),

          SizedBox(height: widget.responsiveSizes.mediumSpacing),

          // Visible OTP Input Fields with obscured text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              return ValueListenableBuilder<List<String>>(
                valueListenable: _enteredOtp,
                builder: (context, otp, _) {
                  return SizedBox(
                    width: 60,
                    child: TextField(
                      controller: _otpControllers[index],
                      focusNode: _otpFocusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      obscureText: true, // This obscures the text with dots
                      obscuringCharacter: '•', // Custom dot character
                      enabled: false,
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: widget.colorScheme.textPrimaryColor,
                      ),
                      decoration: InputDecoration(
                        counterText: '',
                        filled: true,
                        fillColor: widget.colorScheme.backgroundColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: widget.colorScheme.dividerColor,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: widget.colorScheme.primaryColor,
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                      ),
                      onChanged: (value) =>
                          _otpBottomSheetHelper.onOtpChanged(value, index),
                    ),
                  );
                },
              );
            }),
          ),

          SizedBox(height: widget.responsiveSizes.mediumSpacing),

          // Custom Number Pad
          OTPNumberPad(
            colorScheme: widget.colorScheme,
            responsiveSizes: widget.responsiveSizes,
            onNumberPressed: (number) =>
                _otpBottomSheetHelper.onNumberPressed(number),
            backspace: _otpBottomSheetHelper.backspace,
            clearOtp: _otpBottomSheetHelper.clearOtp,
          ),

          SizedBox(height: widget.responsiveSizes.mediumSpacing),

          // Verify Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _otpBottomSheetHelper.verifyOtp,
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.colorScheme.primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  vertical: widget.responsiveSizes.buttonVerticalPadding,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                shadowColor: widget.colorScheme.primaryColor.withValues(
                  alpha: 0.3,
                ),
              ),
              child: Text(
                'Verify OTP',
                style: GoogleFonts.inter(
                  fontSize: widget.responsiveSizes.bodyFontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          SizedBox(height: widget.responsiveSizes.smallSpacing),
        ],
      ),
    );
  }
}
