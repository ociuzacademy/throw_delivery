import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_delivery/core/exports/repository_exports.dart';

part 'complete_delivery_event.dart';
part 'complete_delivery_state.dart';
part 'complete_delivery_bloc.freezed.dart';

class CompleteDeliveryBloc
    extends Bloc<CompleteDeliveryEvent, CompleteDeliveryState> {
  final DeliveryRequestRepository _deliveryRequestRepository;
  CompleteDeliveryBloc({
    required DeliveryRequestRepository deliveryRequestRepository,
  }) : _deliveryRequestRepository = deliveryRequestRepository,
       super(const CompleteDeliveryInitial()) {
    on<_VerifyingOtp>(_onVerifyingOtp);
  }

  Future<void> _onVerifyingOtp(
    _VerifyingOtp event,
    Emitter<CompleteDeliveryState> emit,
  ) async {
    emit(const CompleteDeliveryLoading());
    try {
      await _deliveryRequestRepository.completeDeliveryByEnteringOtp(
        requestId: event.requestId,
        otp: event.otp,
      );
      emit(const CompleteDeliverySuccess());
    } catch (e) {
      emit(CompleteDeliveryError(e.toString()));
    }
  }
}
