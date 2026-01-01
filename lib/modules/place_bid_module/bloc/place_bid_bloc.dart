import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_delivery/core/exports/repository_exports.dart';
import 'package:throw_delivery/core/storage/auth_storage_functions.dart';

part 'place_bid_event.dart';
part 'place_bid_state.dart';
part 'place_bid_bloc.freezed.dart';

class PlaceBidBloc extends Bloc<PlaceBidEvent, PlaceBidState> {
  final DeliveryRequestRepository deliveryRequestRepository;
  PlaceBidBloc({required this.deliveryRequestRepository})
    : super(const PlaceBidInitial()) {
    on<_PlaceBid>(_onPlaceBid);
  }

  Future<void> _onPlaceBid(_PlaceBid event, Emitter<PlaceBidState> emit) async {
    emit(const PlaceBidLoading());
    try {
      final String? agentId = await AuthStorageFunctions().getUid();
      if (agentId == null) {
        emit(const PlaceBidError('User not authenticated'));
        return;
      }
      final bidId = await deliveryRequestRepository.placeBid(
        agentId,
        event.requestId,
        event.bidAmount,
      );
      emit(PlaceBidSuccess(bidId));
    } catch (e) {
      emit(PlaceBidError(e.toString()));
    }
  }
}
