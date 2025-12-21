// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_delivery/core/storage/app_storage_functions.dart';
import 'package:throw_delivery/modules/login_module/view/login_page.dart';

import 'package:throw_delivery/modules/onboarding_module/models/onboarding_slide.dart';

class OnboardingHelper {
  final BuildContext context;
  final PageController pageController;
  final ValueNotifier<int> currentPage;
  final List<OnboardingSlide> slides;
  const OnboardingHelper({
    required this.context,
    required this.pageController,
    required this.currentPage,
    required this.slides,
  });

  void nextPage() {
    if (currentPage.value < slides.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      completeOnboarding();
    }
  }

  void skipOnboarding() {
    completeOnboarding();
  }

  void completeOnboarding() {
    // First, disable the intro screen for future launches
    AppStorageFunctions.disableIntroScreen()
        .then((_) {
          // Then navigate to login page
          if (!context.mounted) return;
          Navigator.of(context).pushReplacement(LoginPage.route());
        })
        .catchError((error) {
          // Even if storage fails, still navigate to login page
          debugPrint('Error saving onboarding status: $error');
          if (!context.mounted) return;
          Navigator.of(context).pushReplacement(LoginPage.route());
        });
  }

  // Responsive helper methods
  static double getResponsivePadding(double screenWidth) {
    if (screenWidth < 350) return 16;
    if (screenWidth < 600) return 24;
    return 32;
  }

  static double getMaxContainerWidth(double screenWidth) {
    if (screenWidth < 350) return 320;
    if (screenWidth < 600) return 400;
    return 500;
  }

  static double getDotSize(double screenWidth) {
    if (screenWidth < 350) return 8;
    if (screenWidth < 600) return 10;
    return 12;
  }

  static double getDotMargin(double screenWidth) {
    if (screenWidth < 350) return 3;
    if (screenWidth < 600) return 4;
    return 5;
  }

  static double getSpacing(double screenWidth) {
    if (screenWidth < 350) return 24;
    if (screenWidth < 600) return 32;
    return 40;
  }

  static double getButtonPadding(double screenWidth) {
    if (screenWidth < 350) return 14;
    if (screenWidth < 600) return 16;
    return 18;
  }

  static double getBorderRadius(double screenWidth) {
    if (screenWidth < 350) return 10;
    if (screenWidth < 600) return 12;
    return 14;
  }

  static double getButtonFontSize(double screenWidth) {
    if (screenWidth < 350) return 14;
    if (screenWidth < 600) return 16;
    return 18;
  }

  // Responsive helper methods for Slide
  static double getContentPadding(double screenWidth) {
    if (screenWidth < 350) return 16;
    if (screenWidth < 600) return 24;
    return 32;
  }

  static double getIconContainerSize(double screenWidth, double screenHeight) {
    final baseSize = screenWidth < 350
        ? 180.0
        : screenWidth < 600
        ? 256.0
        : 300.0;

    // Ensure the container doesn't take more than 50% of screen height
    final maxSize = screenHeight * 0.4;
    return baseSize.clamp(150.0, maxSize);
  }

  static double getIconSize(double screenWidth, double screenHeight) {
    final baseSize = screenWidth < 350
        ? 64.0
        : screenWidth < 600
        ? 96.0
        : 120.0;

    // Ensure the icon doesn't take more than 40% of container size
    final containerSize = getIconContainerSize(screenWidth, screenHeight);
    final maxSize = containerSize * 0.4;
    return baseSize.clamp(48.0, maxSize);
  }

  static double getVerticalSpacing(double screenWidth, double screenHeight) {
    if (screenWidth < 350) return screenHeight * 0.03;
    if (screenWidth < 600) return 32;
    return screenHeight * 0.04;
  }

  static double getTitleFontSize(double screenWidth) {
    if (screenWidth < 350) return 22;
    if (screenWidth < 600) return 28;
    return 32;
  }

  static double getDescriptionSpacing(double screenWidth) {
    if (screenWidth < 350) return 6;
    if (screenWidth < 600) return 8;
    return 12;
  }

  static double getDescriptionPadding(double screenWidth) {
    if (screenWidth < 350) return 8;
    if (screenWidth < 600) return 16;
    return 24;
  }

  static double getDescriptionFontSize(double screenWidth) {
    if (screenWidth < 350) return 14;
    if (screenWidth < 600) return 16;
    return 18;
  }
}
