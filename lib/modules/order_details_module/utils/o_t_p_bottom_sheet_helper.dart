// o_t_p_bottom_sheet_helper.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';
import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';

class OTPBottomSheetHelper {
  final BuildContext context;
  final String requestId;
  final List<TextEditingController> otpControllers;
  final List<FocusNode> otpFocusNodes;
  final ValueNotifier<List<String>> enteredOtp;

  OTPBottomSheetHelper({
    required this.context,
    required this.requestId,
    required this.otpControllers,
    required this.otpFocusNodes,
    required this.enteredOtp,
  });

  void onOtpChanged(String value, int index) {
    if (value.length == 1 && index < 3) {
      FocusScope.of(context).requestFocus(otpFocusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(otpFocusNodes[index - 1]);
    }
    final updated = List<String>.from(enteredOtp.value);
    updated[index] = value;
    enteredOtp.value = updated;
  }

  void verifyOtp() {
    String otp = otpControllers.map((controller) => controller.text).join();
    if (otp.length == 4) {
      // Handle OTP verification logic here
      Navigator.of(context).pop(); // Close the bottom sheet

      final CompleteDeliveryBloc bloc = context.read<CompleteDeliveryBloc>();
      bloc.add(
        CompleteDeliveryEvent.verifyingOtp(requestId: requestId, otp: otp),
      );
    } else {
      // Show error message
      CustomSnackbar.showError(
        context: context,
        message: 'Please enter a valid 4-digit OTP',
      );
    }
  }

  void onNumberPressed(String number) {
    for (int i = 0; i < 4; i++) {
      if (enteredOtp.value[i].isEmpty) {
        final updated = List<String>.from(enteredOtp.value);
        updated[i] = number;
        enteredOtp.value = updated;
        otpControllers[i].text = number;

        if (i < 3) {
          FocusScope.of(context).requestFocus(otpFocusNodes[i + 1]);
        }
        break;
      }
    }
  }

  void backspace() {
    for (int i = 3; i >= 0; i--) {
      if (enteredOtp.value[i].isNotEmpty) {
        final updated = List<String>.from(enteredOtp.value);
        updated[i] = '';
        enteredOtp.value = updated;
        otpControllers[i].clear();

        if (i > 0) {
          FocusScope.of(context).requestFocus(otpFocusNodes[i - 1]);
        } else {
          FocusScope.of(context).requestFocus(otpFocusNodes[0]);
        }
        break;
      }
    }
  }

  void clearOtp() {
    for (int i = 0; i < 4; i++) {
      otpControllers[i].clear();
    }
    enteredOtp.value = List.filled(4, '');
    FocusScope.of(context).requestFocus(otpFocusNodes[0]);
  }
}
