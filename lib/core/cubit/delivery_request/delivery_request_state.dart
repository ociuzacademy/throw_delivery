part of 'delivery_request_cubit.dart';

@freezed
sealed class DeliveryRequestState with _$DeliveryRequestState {
  const factory DeliveryRequestState.initial() = DeliveryRequestInitial;

  const factory DeliveryRequestState.loading() = DeliveryRequestLoading;

  const factory DeliveryRequestState.activeDeliveryRequestsLoaded(
    List<DeliveryRequestModel> activeDeliveryRequests,
  ) = ActiveDeliveryRequestsLoaded;

  const factory DeliveryRequestState.deliveryRequestDetailsLoaded(
    DeliveryRequestModel deliveryRequestDetails,
  ) = DeliveryRequestDetailsLoaded;

  const factory DeliveryRequestState.error(String message) =
      DeliveryRequestError;
}
