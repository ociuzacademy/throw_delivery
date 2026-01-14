import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';
import 'package:throw_delivery/core/exports/enum_exports.dart';
import 'package:throw_delivery/core/models/delivery_request_model.dart';

class WalletWidgetHelper {
  final BuildContext context;

  const WalletWidgetHelper({required this.context});

  void getAgentDeliveryList() {
    final AgentDeliveryListCubit cubit = context.read<AgentDeliveryListCubit>();
    cubit.getAgentDeliveryList();
  }

  double calculateTodayEarnings(List<DeliveryRequestModel> deliveryRequests) {
    final today = DateTime.now();
    double total = 0.0;

    for (var request in deliveryRequests) {
      if (request.paymentStatus != PaymentStatus.escrowAmountReleased) {
        final completedDate = request.updatedAt.toDate();
        if (completedDate.year == today.year &&
            completedDate.month == today.month &&
            completedDate.day == today.day) {
          total += request.agreedDeliveryCharge ?? 0.0;
        }
      }
    }

    return total;
  }

  double calculateTotalEarnings(List<DeliveryRequestModel> deliveryRequests) {
    double total = 0.0;

    for (var request in deliveryRequests) {
      if (request.paymentStatus == PaymentStatus.escrowAmountReleased) {
        total += request.agreedDeliveryCharge ?? 0.0;
      }
    }

    return total;
  }

  double calculateAmountInEscrow(List<DeliveryRequestModel> deliveryRequests) {
    double total = 0.0;

    for (var request in deliveryRequests) {
      if (request.paymentStatus != PaymentStatus.escrowAmountReleased) {
        total += request.agreedDeliveryCharge ?? 0.0;
      }
    }

    return total;
  }

  double calculateAmountReleased(List<DeliveryRequestModel> deliveryRequests) {
    double total = 0.0;

    for (var request in deliveryRequests) {
      if (request.paymentStatus == PaymentStatus.escrowAmountReleased) {
        total += request.agreedDeliveryCharge ?? 0.0;
      }
    }

    return total;
  }
}
