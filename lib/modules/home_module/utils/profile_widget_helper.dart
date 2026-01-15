import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';

class ProfileWidgetHelper {
  final BuildContext context;

  ProfileWidgetHelper({required this.context});

  void deliveryAgentProfileDetailsInit() {
    final DeliveryAgentProfileCubit deliveryAgentProfileCubit = context
        .read<DeliveryAgentProfileCubit>();
    deliveryAgentProfileCubit.getDeliveryAgentProfile();
  }

  void logout() {
    final AuthBloc authBloc = context.read<AuthBloc>();
    authBloc.add(const AuthEvent.signOut());
  }
}
