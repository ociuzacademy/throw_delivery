// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_delivery/modules/bidding_status_module/view/bidding_status_page.dart';

class PlaceBidHelper {
  final BuildContext context;
  late final Timer? _timer;
  final TextEditingController bidAmountController;
  final ValueNotifier<int> totalSeconds;
  final ValueNotifier<bool> isExpired;
  final double baseBidAmount;
  final double currentMinBidAmount;
  PlaceBidHelper({
    required this.context,
    required this.bidAmountController,
    required this.totalSeconds,
    required this.isExpired,
    required this.baseBidAmount,
    required this.currentMinBidAmount,
  });

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!context.mounted) return;

      if (totalSeconds.value > 0) {
        totalSeconds.value = totalSeconds.value - 1;
      } else {
        isExpired.value = true;
        timer.cancel();
        CustomSnackbar.showError(context: context, message: 'Auction expired!');
      }
    });
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  String? validateBidAmount(String? value) {
    if (isExpired.value) {
      return 'Auction has ended';
    }

    if (value == null || value.isEmpty) {
      return 'Please enter a bid amount';
    }

    final amount = double.tryParse(value);
    if (amount == null) {
      return 'Please enter a valid number';
    }

    if (amount <= 0) {
      return 'Bid amount must be greater than 0';
    }

    return null;
  }

  static String formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void submitBid() {
    // Handle bid submission
    FocusScope.of(context).unfocus();
    final String bidAmount = bidAmountController.text.trim();
    if (bidAmountController.text.isNotEmpty &&
        validateBidAmount(bidAmount) == null) {
      cancelTimer();
      // Submit bid logic here
      CustomSnackbar.showSuccess(
        context: context,
        message: 'Bid of \u20B9$bidAmount submitted!',
      );
      final double formatedBidAmount = double.parse(bidAmount);
      Navigator.pushReplacement(
        context,
        BiddingStatusPage.route(
          bidAmount: formatedBidAmount,
          baseBidAmount: baseBidAmount,
          currentMinBid: currentMinBidAmount > formatedBidAmount
              ? formatedBidAmount
              : currentMinBidAmount,
        ),
      );
    } else {
      CustomSnackbar.showError(
        context: context,
        message: 'Please enter a valid bid amount',
      );
    }
  }
}
