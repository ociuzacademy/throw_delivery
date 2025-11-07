// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_delivery/modules/bid_result_module/view/bid_result_page.dart';

class BiddingStatusHelper {
  final BuildContext context;
  late final Timer? _timer;
  late Timer? _bargainSimulationTimer;
  final ValueNotifier<int> totalSecondsNotifier;
  final ValueNotifier<bool> isExpiredNotifier;
  final ValueNotifier<double> currentBidNotifier;
  final ValueNotifier<double> currentMinBidNotifier;
  final ValueNotifier<double> bargainAmountNotifier;
  final ValueNotifier<bool> showBargainSectionNotifier;
  final ValueNotifier<bool> hasValidBargainNotifier;
  final double baseBidAmount;
  final double currentMinimumBid;
  final Random _random = Random();

  BiddingStatusHelper({
    required this.context,
    required this.totalSecondsNotifier,
    required this.isExpiredNotifier,
    required this.currentBidNotifier,
    required this.currentMinBidNotifier,
    required this.bargainAmountNotifier,
    required this.showBargainSectionNotifier,
    required this.hasValidBargainNotifier,
    required this.baseBidAmount,
    required this.currentMinimumBid,
  });

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!context.mounted) return;

      if (totalSecondsNotifier.value > 0) {
        totalSecondsNotifier.value--;
      } else {
        isExpiredNotifier.value = true;
        timer.cancel();
        cancelBargainSimulation();

        // Generate bid result when auction ends
        _generateBidResult();
      }
    });
  }

  void _generateBidResult() {
    final bool isBidAccepted = calculateBidAcceptanceProbability();

    // Navigate to BidResultPage after a short delay
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          BidResultPage.route(
            isBidAccepted: isBidAccepted,
            pickupAddress: '123 Main Street, Koramangala, Bengaluru',
            dropoffAddress: '456 Oak Avenue, HSR Layout, Bengaluru',
          ),
        );
      }
    });
  }

  bool calculateBidAcceptanceProbability() {
    final double currentBid = currentBidNotifier.value;

    // Base acceptance probability (50% chance by default)
    double acceptanceProbability = 0.5;

    // Factor 1: How close the bid is to the base bid amount
    // The closer to base bid, higher the chance
    if (currentBid <= baseBidAmount) {
      final double baseBidProximity =
          (baseBidAmount - currentBid) / baseBidAmount;
      acceptanceProbability += baseBidProximity * 0.3; // Up to 30% bonus
    }

    // Factor 2: How competitive the bid is compared to current minimum
    // If bid is lower than current minimum, higher chance
    if (currentBid < currentMinimumBid) {
      final double competitiveness =
          (currentMinimumBid - currentBid) / currentMinimumBid;
      acceptanceProbability += competitiveness * 0.4; // Up to 40% bonus
    } else if (currentBid > currentMinimumBid) {
      // If bid is higher than current minimum, lower chance
      final double disadvantage = (currentBid - currentMinimumBid) / currentBid;
      acceptanceProbability -= disadvantage * 0.3; // Up to 30% penalty
    }

    // Factor 3: Random element to simulate real-world uncertainty
    final double randomFactor =
        _random.nextDouble() * 0.2 - 0.1; // -10% to +10%
    acceptanceProbability += randomFactor;

    // Ensure probability stays within reasonable bounds (10% to 95%)
    acceptanceProbability = acceptanceProbability.clamp(0.1, 0.95);

    // Generate random number and compare with calculated probability
    final double randomValue = _random.nextDouble();
    final bool isAccepted = randomValue <= acceptanceProbability;

    // Log the calculation for debugging (remove in production)
    debugPrint('''
Bid Acceptance Calculation:
- Current Bid: ₹$currentBid
- Base Bid: ₹$baseBidAmount
- Current Min Bid: ₹$currentMinimumBid
- Calculated Probability: ${(acceptanceProbability * 100).toStringAsFixed(1)}%
- Random Value: ${(randomValue * 100).toStringAsFixed(1)}%
- Result: ${isAccepted ? 'ACCEPTED' : 'REJECTED'}
''');

    return isAccepted;
  }

  void startBargainSimulation() {
    // Simulate server sending bargain amounts at random intervals
    _bargainSimulationTimer = Timer.periodic(const Duration(seconds: 10), (
      timer,
    ) {
      if (!context.mounted || isExpiredNotifier.value) {
        timer.cancel();
        return;
      }

      _simulateServerBargain();
    });

    // Also simulate an initial bargain after a short delay
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted && !isExpiredNotifier.value) {
        _simulateServerBargain();
      }
    });
  }

  void _simulateServerBargain() {
    // Generate a random bargain amount between 0 and current bid (exclusive)
    // Ensure: 0 < bargain amount < current bid amount
    final double currentBid = currentBidNotifier.value;

    if (currentBid <= 0) {
      hasValidBargainNotifier.value = false;
      showBargainSectionNotifier.value = false;
      return;
    }

    // Generate a random percentage between 10% and 90% of current bid
    final double percentage = 0.1 + _random.nextDouble() * 0.8; // 10% to 90%
    double newBargainAmount = currentBid * percentage;

    // Round to 2 decimal places
    newBargainAmount = double.parse(newBargainAmount.toStringAsFixed(2));

    // Ensure the bargain amount is valid: 0 < bargain < current bid
    if (newBargainAmount > 0 && newBargainAmount < currentBid) {
      bargainAmountNotifier.value = newBargainAmount;
      hasValidBargainNotifier.value = true;
      showBargainSectionNotifier.value = true;

      CustomSnackbar.showInfo(
        context: context,
        message: 'New bargain offer: ₹${newBargainAmount.toStringAsFixed(2)}',
      );
    } else {
      hasValidBargainNotifier.value = false;
      showBargainSectionNotifier.value = false;
    }
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  void cancelBargainSimulation() {
    _bargainSimulationTimer?.cancel();
  }

  static String formattedTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void handleAcceptBargain() {
    if (!hasValidBargainNotifier.value || bargainAmountNotifier.value <= 0) {
      CustomSnackbar.showError(
        context: context,
        message: 'Invalid bargain amount. Please try again.',
      );
      return;
    }

    // Update current bid to bargain amount
    currentBidNotifier.value = bargainAmountNotifier.value;
    if (currentMinBidNotifier.value > bargainAmountNotifier.value) {
      currentMinBidNotifier.value = bargainAmountNotifier.value;
    }
    // Hide bargain section
    showBargainSectionNotifier.value = false;
    // Reset bargain amount
    bargainAmountNotifier.value = 0.0;
    hasValidBargainNotifier.value = false;

    CustomSnackbar.showSuccess(
      context: context,
      message:
          'Bargain accepted! Your bid is now ₹${currentBidNotifier.value.toStringAsFixed(2)}',
    );
  }

  void handleRejectBargain() {
    // Keep current bid as is, just hide bargain section
    showBargainSectionNotifier.value = false;
    // Reset bargain amount
    bargainAmountNotifier.value = 0.0;
    hasValidBargainNotifier.value = false;

    CustomSnackbar.showInfo(
      context: context,
      message:
          'Bargain rejected! Your bid remains ₹${currentBidNotifier.value.toStringAsFixed(2)}',
    );
  }

  // Method to simulate a specific bargain amount from server (for testing)
  void simulateServerBargain(double amount) {
    if (!context.mounted || isExpiredNotifier.value) return;

    final double currentBid = currentBidNotifier.value;

    // Validate the bargain amount: 0 < amount < current bid
    if (amount > 0 && amount < currentBid) {
      bargainAmountNotifier.value = amount;
      hasValidBargainNotifier.value = true;
      showBargainSectionNotifier.value = true;

      CustomSnackbar.showInfo(
        context: context,
        message: 'New bargain offer: ₹${amount.toStringAsFixed(2)}',
      );
    } else {
      hasValidBargainNotifier.value = false;
      showBargainSectionNotifier.value = false;

      CustomSnackbar.showError(
        context: context,
        message:
            'Invalid bargain amount from server: ₹${amount.toStringAsFixed(2)}',
      );
    }
  }
}
