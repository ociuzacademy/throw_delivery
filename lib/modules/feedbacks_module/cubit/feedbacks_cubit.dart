import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_delivery/core/exports/repository_exports.dart';
import 'package:throw_delivery/core/models/feedback_model.dart';
import 'package:throw_delivery/core/storage/auth_storage_functions.dart';

part 'feedbacks_state.dart';
part 'feedbacks_cubit.freezed.dart';

class FeedbacksCubit extends Cubit<FeedbacksState> {
  final FeedbackRepository _feedbackRepository;
  FeedbacksCubit({required FeedbackRepository feedbackRepository})
    : _feedbackRepository = feedbackRepository,
      super(const FeedbacksState.initial());

  Future<void> loadFeedbacks() async {
    emit(const FeedbacksState.loading());
    try {
      // Fetch delivery agent uid from the local storage or authentication service
      final String? deliveryAgentUid = await AuthStorageFunctions().getUid();

      if (deliveryAgentUid == null) {
        emit(const FeedbacksState.error('Delivery agent UID not found.'));
        return;
      }

      // For demonstration, we create an empty list of feedbacks
      final List<FeedbackModel> feedbacks = await _feedbackRepository
          .getFeedbackForDeliveryAgent(deliveryAgentUid);

      if (feedbacks.isEmpty) {
        emit(const FeedbacksState.empty());
      } else {
        emit(FeedbacksState.success(feedbacks));
      }
    } catch (e) {
      emit(FeedbacksState.error(e.toString()));
    }
  }
}
