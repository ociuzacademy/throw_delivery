part of 'active_delivery_list_cubit.dart';

@freezed
sealed class ActiveDeliveryListState with _$ActiveDeliveryListState {
  const factory ActiveDeliveryListState.initial() = ActiveDeliveryListInitial;
  const factory ActiveDeliveryListState.loading() = ActiveDeliveryListLoading;
  const factory ActiveDeliveryListState.success(
    List<DeliveryRequestModel> activeDeliveryRequests,
  ) = ActiveDeliveryListSuccess;
  const factory ActiveDeliveryListState.empty() = ActiveDeliveryListEmpty;
  const factory ActiveDeliveryListState.error(String message) =
      ActiveDeliveryListError;
}
