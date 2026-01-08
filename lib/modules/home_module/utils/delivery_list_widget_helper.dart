import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';

class DeliveryListWidgetHelper {
  final BuildContext context;

  const DeliveryListWidgetHelper({required this.context});

  void getAgentDeliveryList() {
    final AgentDeliveryListCubit cubit = context.read<AgentDeliveryListCubit>();
    cubit.getAgentDeliveryList();
  }
}
