import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_delivery/core/models/delivery_request_model.dart';
import 'package:throw_delivery/core/repository/delivery_request_repository.dart';

part 'delivery_request_state.dart';
part 'delivery_request_cubit.freezed.dart';

class DeliveryRequestCubit extends Cubit<DeliveryRequestState> {
  final DeliveryRequestRepository deliveryRequestRepository;
  DeliveryRequestCubit({required this.deliveryRequestRepository})
    : super(const DeliveryRequestState.initial());

  Future<void> getActiveDeliveryRequests() async {
    emit(const DeliveryRequestState.loading());
    try {
      final deliveryRequests = await deliveryRequestRepository
          .getDeliveryRequestByUid();
      emit(DeliveryRequestState.activeDeliveryRequestsLoaded(deliveryRequests));
    } catch (e) {
      emit(DeliveryRequestState.error(e.toString()));
    }
  }

  Future<void> getDeliveryRequestDetails(String requestId) async {
    emit(const DeliveryRequestState.loading());
    try {
      final deliveryRequest = await deliveryRequestRepository
          .getDeliveryRequestById(requestId);
      emit(DeliveryRequestState.deliveryRequestDetailsLoaded(deliveryRequest));
    } catch (e) {
      emit(DeliveryRequestState.error(e.toString()));
    }
  }

  void resetState() {
    emit(const DeliveryRequestState.initial());
  }
}
