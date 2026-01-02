part of 'bargain_action_bloc.dart';

@freezed
sealed class BargainActionState with _$BargainActionState {
  const factory BargainActionState.initial() = BargainActionInitial;
  const factory BargainActionState.loading(String message) =
      BargainActionLoading;
  const factory BargainActionState.acceptBargainSuccess() =
      AcceptBargainSuccess;
  const factory BargainActionState.rejectBargainSuccess() =
      RejectBargainSuccess;
  const factory BargainActionState.error(String message) = BargainActionError;
}
