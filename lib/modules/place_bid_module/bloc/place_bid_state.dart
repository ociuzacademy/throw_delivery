part of 'place_bid_bloc.dart';

@freezed
sealed class PlaceBidState with _$PlaceBidState {
  const factory PlaceBidState.initial() = PlaceBidInitial;
  const factory PlaceBidState.loading() = PlaceBidLoading;
  const factory PlaceBidState.success(String bidId) = PlaceBidSuccess;
  const factory PlaceBidState.error(String message) = PlaceBidError;
}
