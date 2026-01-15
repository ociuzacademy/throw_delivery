import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
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

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Logout',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to logout?',
            style: GoogleFonts.poppins(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _profileWidgetHelper.logout();
              },
              child: Text(
                'Logout',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
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
                    ElevatedButton.icon(
                      onPressed: () => _showLogoutConfirmation(context),
                      icon: const Icon(Icons.logout),
                      label: Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(48),
                      ),
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
