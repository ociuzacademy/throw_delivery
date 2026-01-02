// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';

class BiddingStatusHelper {
  final BuildContext context;
  final String bidId;
  late final Timer? _timer;
  final ValueNotifier<int> totalSecondsNotifier;
  final ValueNotifier<bool> isExpiredNotifier;
  final double baseBidAmount;
  final double currentMinimumBid;

  BiddingStatusHelper({
    required this.context,
    required this.bidId,
    required this.totalSecondsNotifier,
    required this.isExpiredNotifier,
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
      }
    });
  }

  static int calculateRemainingSeconds(DateTime startTime) {
    final now = DateTime.now();
    final difference = now.difference(startTime);
    final remaining = 300 - difference.inSeconds; // 5 minutes = 300 seconds
    return remaining > 0 ? remaining : 0;
  }

  void cancelTimer() {
    _timer?.cancel();
  }

  static String formattedTime(int totalSeconds) {
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  void handleAcceptBargain() {}

  void handleRejectBargain() {}

  void simulateServerBargain(double amount) {}
}
