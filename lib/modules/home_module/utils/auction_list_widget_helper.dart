import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';

class AuctionListWidgetHelper {
  final BuildContext context;

  const AuctionListWidgetHelper(this.context);

  void getActiveDeliveryRequests() {
    final DeliveryRequestCubit deliveryRequestCubit = context
        .read<DeliveryRequestCubit>();
    deliveryRequestCubit.getActiveDeliveryRequests();
  }

  void resetState() {
    final DeliveryRequestCubit deliveryRequestCubit = context
        .read<DeliveryRequestCubit>();
    deliveryRequestCubit.resetState();
  }
}
