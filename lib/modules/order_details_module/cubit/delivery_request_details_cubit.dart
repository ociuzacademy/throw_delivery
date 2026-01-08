import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_delivery/core/exports/repository_exports.dart';
import 'package:throw_delivery/core/models/delivery_request_model.dart';

part 'delivery_request_details_state.dart';
part 'delivery_request_details_cubit.freezed.dart';

class DeliveryRequestDetailsCubit extends Cubit<DeliveryRequestDetailsState> {
  final DeliveryRequestRepository _deliveryRequestRepository;
  DeliveryRequestDetailsCubit({
    required DeliveryRequestRepository deliveryRequestRepository,
  }) : _deliveryRequestRepository = deliveryRequestRepository,
       super(const DeliveryRequestDetailsState.initial());

  Future<void> getDeliveryRequestDetails(String orderId) async {
    emit(const DeliveryRequestDetailsState.loading());
    try {
      final result = await _deliveryRequestRepository.getDeliveryRequestDetails(
        orderId,
      );
      emit(DeliveryRequestDetailsState.success(result));
    } catch (e) {
      emit(DeliveryRequestDetailsState.error(e.toString()));
    }
  }
}
