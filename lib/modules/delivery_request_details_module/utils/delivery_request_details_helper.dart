import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';

class DeliveryRequestDetailsHelper {
  final BuildContext context;
  final String requestId;

  const DeliveryRequestDetailsHelper({
    required this.context,
    required this.requestId,
  });

  void getDeliveryRequestDetails() {
    final DeliveryRequestCubit deliveryRequestCubit = context
        .read<DeliveryRequestCubit>();
    deliveryRequestCubit.getDeliveryRequestDetails(requestId);
  }
}
