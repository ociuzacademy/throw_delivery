import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';
import 'package:throw_delivery/core/theme/app_colors.dart';
import 'package:throw_delivery/core/widgets/custom_empty_widget.dart';
import 'package:throw_delivery/core/widgets/custom_error_widget.dart';
import 'package:throw_delivery/core/widgets/loaders/custom_loader_widget.dart';
import 'package:throw_delivery/modules/feedbacks_module/utils/feedbacks_helper.dart';
import 'package:throw_delivery/modules/feedbacks_module/widgets/average_rating_card_widget.dart';
import 'package:throw_delivery/modules/feedbacks_module/widgets/feedback_header_widget.dart';
import 'package:throw_delivery/modules/feedbacks_module/widgets/review_tem_widget.dart';

class FeedbacksPage extends StatefulWidget {
  const FeedbacksPage({super.key});

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => const FeedbacksPage());

  @override
  State<FeedbacksPage> createState() => _FeedbacksPageState();
}

class _FeedbacksPageState extends State<FeedbacksPage> {
  late final FeedbacksHelper _feedbacksHelper;

  @override
  void initState() {
    super.initState();
    _feedbacksHelper = FeedbacksHelper(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _feedbacksHelper.deliveryAgentProfileInitialize();
      _feedbacksHelper.feedbacksInitialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: FeedbackHeader(onBackPressed: () => Navigator.of(context).pop()),
      body: SafeArea(
        child: Container(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.darkBackground
              : AppColors.lightBackground,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                BlocBuilder<
                  DeliveryAgentProfileCubit,
                  DeliveryAgentProfileState
                >(
                  builder: (context, state) {
                    return switch (state) {
                      DeliveryAgentProfileLoading() => const CustomLoaderWidget(
                        message: 'Loading profile...',
                      ),
                      DeliveryAgentProfileSuccess(:final deliveryAgent) =>
                        AverageRatingCard(
                          rating: deliveryAgent.averageRating,
                          reviewCount: deliveryAgent.numberOfRatings,
                        ),
                      DeliveryAgentProfileError(:final message) =>
                        CustomErrorWidget(
                          errorMessage: message,
                          isDark: isDark,
                          onRetry:
                              _feedbacksHelper.deliveryAgentProfileInitialize,
                        ),
                      _ => const SizedBox.shrink(),
                    };
                  },
                ),
                const SizedBox(height: 16),
                BlocBuilder<FeedbacksCubit, FeedbacksState>(
                  builder: (context, state) {
                    return switch (state) {
                      FeedbacksLoading() => const CustomLoaderWidget(
                        message: 'Loading reviews...',
                      ),
                      FeedbacksError(:final message) => CustomErrorWidget(
                        errorMessage: message,
                        isDark: Theme.of(context).brightness == Brightness.dark,
                        onRetry: () => _feedbacksHelper.feedbacksInitialize(),
                      ),
                      FeedbacksEmpty() => CustomEmptyWidget(
                        message: 'There are no user feedbacks available',
                        isDark: isDark,
                      ),
                      FeedbacksSuccess(:final feedbacks) => ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: feedbacks.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          return ReviewItemWidget(feedback: feedbacks[index]);
                        },
                      ),
                      _ => const SizedBox.shrink(),
                    };
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
