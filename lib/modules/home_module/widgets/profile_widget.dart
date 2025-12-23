import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';
import 'package:throw_delivery/core/widgets/custom_error_widget.dart';
import 'package:throw_delivery/modules/feedbacks_module/view/feedbacks_page.dart';
import 'package:throw_delivery/modules/home_module/utils/profile_widget_helper.dart';
import 'package:throw_delivery/modules/home_module/widgets/feedback_card.dart';
import 'package:throw_delivery/modules/home_module/widgets/personal_info.dart';
import 'package:throw_delivery/modules/home_module/widgets/profile_header.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  late final ProfileWidgetHelper _profileWidgetHelper;
  @override
  void initState() {
    super.initState();
    _profileWidgetHelper = ProfileWidgetHelper(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _profileWidgetHelper.deliveryAgentProfileDetailsInit();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: BlocBuilder<DeliveryAgentProfileCubit, DeliveryAgentProfileState>(
        builder: (context, state) {
          return switch (state) {
            DeliveryAgentProfileInitial() => const SizedBox.shrink(),
            DeliveryAgentProfileLoading() => const Center(
              child: CircularProgressIndicator(),
            ),

            DeliveryAgentProfileError(:final message) => CustomErrorWidget(
              errorMessage: message,
              isDark: isDark,
              onRetry: _profileWidgetHelper.deliveryAgentProfileDetailsInit,
            ),
            DeliveryAgentProfileSuccess(:final deliveryAgent) =>
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ProfileHeader(
                      name: deliveryAgent.displayName,
                      imageUrl: deliveryAgent.photoUrl,
                    ),
                    const SizedBox(height: 16),
                    PersonalInfo(
                      email: deliveryAgent.email,
                      phone: deliveryAgent.phoneNumber,
                    ),
                    const SizedBox(height: 16),
                    FeedbackCard(
                      onTap: () {
                        Navigator.push(context, FeedbacksPage.route());
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
          };
        },
      ),
    );
  }
}
