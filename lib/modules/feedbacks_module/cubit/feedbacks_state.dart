part of 'feedbacks_cubit.dart';

@freezed
sealed class FeedbacksState with _$FeedbacksState {
  const factory FeedbacksState.initial() = FeedbacksInitial;
  const factory FeedbacksState.loading() = FeedbacksLoading;
  const factory FeedbacksState.success(List<FeedbackModel> feedbacks) =
      FeedbacksSuccess;
  const factory FeedbacksState.empty() = FeedbacksEmpty;
  const factory FeedbacksState.error(String message) = FeedbacksError;
}
