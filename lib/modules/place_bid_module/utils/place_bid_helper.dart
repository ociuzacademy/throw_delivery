// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';

import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';

class PlaceBidHelper {
  final BuildContext context;
  final String requestId;
  final DateTime auctionStartTime;
  late final Timer? _timer;
  final TextEditingController bidAmountController;
  final ValueNotifier<int> totalSeconds;
  final ValueNotifier<bool> isExpired;
  final double baseBidAmount;
  final double currentMinBidAmount;
  PlaceBidHelper({
    required this.context,
    required this.requestId,
    required this.auctionStartTime,
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

    if (amount > baseBidAmount) {
      return 'Bid amount must be less than or equal to base bid amount';
    }

    // if (amount <= currentMinBidAmount) {
    //   return 'Bid amount must be greater than current minimum bid amount';
    // }

    return null;
  }

  static String formatTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  static int calculateRemainingSeconds(DateTime startTime) {
    final now = DateTime.now();
    final difference = now.difference(startTime);
    final remaining = 300 - difference.inSeconds; // 5 minutes = 300 seconds
    return remaining > 0 ? remaining : 0;
  }

  void submitBid() {
    // Handle bid submission
    FocusScope.of(context).unfocus();
    final String bidAmount = bidAmountController.text.trim();
    if (bidAmountController.text.isNotEmpty &&
        validateBidAmount(bidAmount) == null) {
      cancelTimer();
      // Submit bid logic here
      final double formatedBidAmount = double.parse(bidAmount);
      final PlaceBidBloc bloc = context.read<PlaceBidBloc>();
      bloc.add(
        PlaceBidEvent.placeBid(
          requestId: requestId,
          bidAmount: formatedBidAmount,
        ),
      );
      // CustomSnackbar.showSuccess(
      //   context: context,
      //   message: 'Bid of \u20B9$bidAmount submitted!',
      // );
      // Navigator.pushReplacement(
      //   context,
      //   BiddingStatusPage.route(
      //     bidAmount: formatedBidAmount,
      //     baseBidAmount: baseBidAmount,
      //     currentMinBid: currentMinBidAmount > formatedBidAmount
      //         ? formatedBidAmount
      //         : currentMinBidAmount,
      //   ),
      // );
    } else {
      CustomSnackbar.showError(
        context: context,
        message: 'Please enter a valid bid amount',
      );
    }
  }
}
