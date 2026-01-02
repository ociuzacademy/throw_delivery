part of 'bid_status_cubit.dart';

@freezed
sealed class BidStatusState with _$BidStatusState {
  const factory BidStatusState.initial() = BidStatusInitial;
  const factory BidStatusState.loading() = BidStatusLoading;
  const factory BidStatusState.success({
    required BidModel bid,
    required DeliveryRequestModel deliveryRequest,
  }) = BidStatusSuccess;
  const factory BidStatusState.error({required String message}) =
      BidStatusError;
}
