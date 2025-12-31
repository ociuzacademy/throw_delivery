import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_delivery/core/models/delivery_request_model.dart';
import 'package:throw_delivery/core/repository/delivery_request_repository.dart';

part 'active_delivery_list_state.dart';
part 'active_delivery_list_cubit.freezed.dart';

class ActiveDeliveryListCubit extends Cubit<ActiveDeliveryListState> {
  final DeliveryRequestRepository deliveryRequestRepository;
  ActiveDeliveryListCubit({required this.deliveryRequestRepository})
    : super(const ActiveDeliveryListState.initial());

  Future<void> getActiveDeliveryList() async {
    emit(const ActiveDeliveryListState.loading());
    try {
      final activeDeliveryList = await deliveryRequestRepository
          .getActiveDeliveryRequests();
      if (activeDeliveryList.isEmpty) {
        emit(const ActiveDeliveryListState.empty());
      } else {
        emit(ActiveDeliveryListState.success(activeDeliveryList));
      }
    } catch (e) {
      emit(ActiveDeliveryListState.error(e.toString()));
    }
  }
}
