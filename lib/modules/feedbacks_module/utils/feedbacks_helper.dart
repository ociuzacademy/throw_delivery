import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';

class FeedbacksHelper {
  final BuildContext context;

  const FeedbacksHelper({required this.context});

  void deliveryAgentProfileInitialize() {
    final DeliveryAgentProfileCubit deliveryAgentProfileCubit = context
        .read<DeliveryAgentProfileCubit>();
    deliveryAgentProfileCubit.getDeliveryAgentProfile();
  }

  void feedbacksInitialize() {
    final FeedbacksCubit feedbacksCubit = context.read<FeedbacksCubit>();
    feedbacksCubit.loadFeedbacks();
  }
}
