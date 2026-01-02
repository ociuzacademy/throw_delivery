import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_delivery/core/repository/delivery_request_repository.dart';

part 'bargain_action_event.dart';
part 'bargain_action_state.dart';
part 'bargain_action_bloc.freezed.dart';

class BargainActionBloc extends Bloc<BargainActionEvent, BargainActionState> {
  final DeliveryRequestRepository _deliveryRequestRepository;
  BargainActionBloc({
    required DeliveryRequestRepository deliveryRequestRepository,
  }) : _deliveryRequestRepository = deliveryRequestRepository,
       super(const BargainActionInitial()) {
    on<_AcceptBargain>(_onAcceptBargain);
    on<_RejectBargain>(_onRejectBargain);
  }

  Future<void> _onAcceptBargain(
    _AcceptBargain event,
    Emitter<BargainActionState> emit,
  ) async {
    emit(const BargainActionLoading('Accepting bargain...'));
    try {
      await _deliveryRequestRepository.acceptBargain(
        requestId: event.requestId,
        bidId: event.bidId,
        bargainAmount: event.bargainAmount,
      );
      emit(const AcceptBargainSuccess());
    } catch (e) {
      emit(BargainActionError(e.toString()));
    }
  }

  Future<void> _onRejectBargain(
    _RejectBargain event,
    Emitter<BargainActionState> emit,
  ) async {
    emit(const BargainActionLoading('Rejecting bargain...'));
    try {
      await _deliveryRequestRepository.rejectBargain(
        requestId: event.requestId,
        bidId: event.bidId,
      );
      emit(const RejectBargainSuccess());
    } catch (e) {
      emit(BargainActionError(e.toString()));
    }
  }
}
