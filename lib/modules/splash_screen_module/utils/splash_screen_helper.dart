// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:throw_delivery/modules/home_module/view/home_page.dart';
import 'package:throw_delivery/modules/login_module/view/login_page.dart';
import 'package:throw_delivery/modules/onboarding_module/view/onboarding_page.dart';
import 'package:throw_delivery/modules/profile_review_module/view/profile_review_page.dart';
import 'package:throw_delivery/modules/vehicle_register_module/view/vehicle_register_page.dart';

class SplashScreenHelper {
  final BuildContext context;
  final bool isFirstLaunch;
  final bool isRegistered;
  final bool isApproved;
  final bool isLoggedIn;
  const SplashScreenHelper({
    required this.context,
    required this.isFirstLaunch,
    required this.isLoggedIn,
    this.isRegistered = false,
    this.isApproved = false,
  });

  void navigateToNextPage() {
    if (isFirstLaunch) {
      Navigator.of(context).pushReplacement(OnboardingPage.route());
    } else {
      if (isLoggedIn) {
        if (!isRegistered) {
          Navigator.of(context).pushReplacement(VehicleRegisterPage.route());
        } else {
          if (isApproved) {
            Navigator.of(context).pushReplacement(HomePage.route());
          } else {
            Navigator.of(context).pushReplacement(ProfileReviewPage.route());
          }
        }
      } else {
        Navigator.of(context).pushReplacement(LoginPage.route());
      }
    }
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
