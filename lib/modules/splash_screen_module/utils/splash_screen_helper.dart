// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_delivery/modules/document_upload_module/view/document_upload_page.dart';

import 'package:throw_delivery/modules/home_module/view/home_page.dart';
import 'package:throw_delivery/modules/login_module/view/login_page.dart';
import 'package:throw_delivery/modules/onboarding_module/view/onboarding_page.dart';
import 'package:throw_delivery/modules/profile_review_module/view/profile_review_page.dart';
import 'package:throw_delivery/modules/vehicle_register_module/view/vehicle_register_page.dart';

class SplashScreenHelper {
  final BuildContext context;
  final bool isFirstLaunch;
  final bool hasVehicleRegistered;
  final bool hasApproved;
  final bool isLoggedIn;
  final bool hasDocumentUploaded;
  const SplashScreenHelper({
    required this.context,
    required this.isFirstLaunch,
    required this.isLoggedIn,
    required this.hasVehicleRegistered,
    required this.hasApproved,
    required this.hasDocumentUploaded,
  });

  void navigateToNextPage() {
    if (isFirstLaunch) {
      Navigator.pushReplacement(context, OnboardingPage.route());
    } else {
      if (isLoggedIn) {
        if (!hasVehicleRegistered) {
          Navigator.pushReplacement(context, VehicleRegisterPage.route());
        } else if (!hasDocumentUploaded) {
          Navigator.pushReplacement(context, DocumentUploadPage.route());
        } else {
          if (hasApproved) {
            Navigator.pushReplacement(context, HomePage.route());
          } else {
            Navigator.pushReplacement(context, ProfileReviewPage.route());
          }
        }
      } else {
        Navigator.pushReplacement(context, LoginPage.route());
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
