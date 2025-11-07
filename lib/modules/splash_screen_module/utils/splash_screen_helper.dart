// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:throw_delivery/modules/onboarding_module/view/onboarding_page.dart';

class SplashScreenHelper {
  final BuildContext context;
  const SplashScreenHelper({required this.context});

  void navigateToNextPage() {
    Navigator.of(context).pushReplacement(OnboardingPage.route());
  }

  // Helper method to get responsive values based on screen width
  static double getResponsiveValue({
    required double screenWidth,
    required double small,
    required double normal,
    required double large,
  }) {
    if (screenWidth < 350) {
      // Small phones
      return small;
    } else if (screenWidth < 600) {
      // Normal phones
      return normal;
    } else {
      // Tablets and larger screens
      return large;
    }
  }
}
