part of 'place_bid_bloc.dart';

@freezed
sealed class PlaceBidEvent with _$PlaceBidEvent {
  const factory PlaceBidEvent.started() = _Started;
  const factory PlaceBidEvent.placeBid({
    required String requestId,
    required double bidAmount,
  }) = _PlaceBid;
}
