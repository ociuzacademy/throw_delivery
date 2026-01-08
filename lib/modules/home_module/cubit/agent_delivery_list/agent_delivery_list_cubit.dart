import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_delivery/core/exports/repository_exports.dart';
import 'package:throw_delivery/core/models/delivery_request_model.dart';
import 'package:throw_delivery/core/storage/auth_storage_functions.dart';

part 'agent_delivery_list_state.dart';
part 'agent_delivery_list_cubit.freezed.dart';

class AgentDeliveryListCubit extends Cubit<AgentDeliveryListState> {
  final DeliveryRequestRepository _deliveryRequestRepository;
  AgentDeliveryListCubit({
    required DeliveryRequestRepository deliveryRequestRepository,
  }) : _deliveryRequestRepository = deliveryRequestRepository,
       super(const AgentDeliveryListState.initial());

  Future<void> getAgentDeliveryList() async {
    emit(const AgentDeliveryListState.loading());
    try {
      final String? agentId = await AuthStorageFunctions().getUid();

      if (agentId == null) {
        emit(const AgentDeliveryListState.error('User not found'));
        return;
      }

      final deliveryRequests = await _deliveryRequestRepository
          .getDeliveryRequestOfDeliveryAgent(agentId);
      emit(AgentDeliveryListState.loaded(deliveryRequests));
    } catch (e) {
      emit(AgentDeliveryListState.error(e.toString()));
    }
  }
}
