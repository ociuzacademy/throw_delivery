part of 'bargain_action_bloc.dart';

@freezed
sealed class BargainActionEvent with _$BargainActionEvent {
  const factory BargainActionEvent.started() = _Started;
  const factory BargainActionEvent.acceptBargain({
    required String requestId,
    required String bidId,
    required double bargainAmount,
  }) = _AcceptBargain;
  const factory BargainActionEvent.rejectBargain({
    required String requestId,
    required String bidId,
  }) = _RejectBargain;
}
