import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_delivery/core/models/bid_model.dart';
import 'package:throw_delivery/core/models/delivery_request_model.dart';
import 'package:throw_delivery/core/repository/delivery_request_repository.dart';

part 'bid_status_state.dart';
part 'bid_status_cubit.freezed.dart';

class BidStatusCubit extends Cubit<BidStatusState> {
  final DeliveryRequestRepository _repository;
  StreamSubscription<BidModel>? _subscription;
  BidStatusCubit({required DeliveryRequestRepository repository})
    : _repository = repository,
      super(const BidStatusState.initial());

  void getBidStatus({required String requestId, required String bidId}) async {
    emit(const BidStatusState.loading());
    try {
      _subscription?.cancel();
      _subscription = _repository.getBidDetails(requestId, bidId).listen((
        bid,
      ) async {
        final deliveryRequest = await _repository.getDeliveryRequestById(
          requestId,
        );
        emit(
          BidStatusState.success(bid: bid, deliveryRequest: deliveryRequest),
        );
      });
    } catch (e) {
      emit(BidStatusState.error(message: e.toString()));
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
