import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/cubit/delivery_agent_profile/delivery_agent_profile_cubit.dart';

class ProfileWidgetHelper {
  final BuildContext context;

  ProfileWidgetHelper({required this.context});

  void deliveryAgentProfileDetailsInit() {
    final DeliveryAgentProfileCubit deliveryAgentProfileCubit = context
        .read<DeliveryAgentProfileCubit>();
    deliveryAgentProfileCubit.getDeliveryAgentProfile();
  }
}
