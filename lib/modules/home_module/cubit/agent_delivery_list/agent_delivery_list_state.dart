part of 'agent_delivery_list_cubit.dart';

@freezed
sealed class AgentDeliveryListState with _$AgentDeliveryListState {
  const factory AgentDeliveryListState.initial() = AgentDeliveryListInitial;
  const factory AgentDeliveryListState.loading() = AgentDeliveryListLoading;
  const factory AgentDeliveryListState.loaded(
    List<DeliveryRequestModel> deliveryRequests,
  ) = AgentDeliveryListLoaded;
  const factory AgentDeliveryListState.empty() = AgentDeliveryListEmpty;
  const factory AgentDeliveryListState.error(String message) =
      AgentDeliveryListError;
}
