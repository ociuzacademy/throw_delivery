// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';

class LoginHelper {
  final BuildContext context;
  const LoginHelper({required this.context});

  void handleLogin() {
    final AuthBloc authBloc = context.read<AuthBloc>();
    authBloc.add(const AuthEvent.signInWithGoogle());
  }

  // Responsive helper methods
  static double getHeaderPadding(double screenWidth) {
    if (screenWidth < 350) return 12;
    if (screenWidth < 600) return 16;
    return 20;
  }

  static double getIconSize(double screenWidth) {
    if (screenWidth < 350) return 20;
    if (screenWidth < 600) return 24;
    return 28;
  }

  static double getTitleFontSize(double screenWidth) {
    if (screenWidth < 350) return 16;
    if (screenWidth < 600) return 18;
    return 20;
  }

  static double getContentPadding(double screenWidth) {
    if (screenWidth < 350) return 16;
    if (screenWidth < 600) return 24;
    return 32;
  }

  static double getMaxContainerWidth(double screenWidth) {
    if (screenWidth < 350) return 320;
    if (screenWidth < 600) return 400;
    return 500;
  }

  static double getWelcomeSpacing(double screenHeight) {
    return screenHeight * 0.02.clamp(20, 60);
  }

  static double getWelcomeTitleFontSize(double screenWidth) {
    if (screenWidth < 350) return 24;
    if (screenWidth < 600) return 28;
    return 32;
  }

  static double getWelcomeSubtitleSpacing(double screenWidth) {
    if (screenWidth < 350) return 6;
    if (screenWidth < 600) return 8;
    return 12;
  }

  static double getWelcomeSubtitleFontSize(double screenWidth) {
    if (screenWidth < 350) return 14;
    if (screenWidth < 600) return 16;
    return 18;
  }

  static double getFormSpacing(double screenHeight) {
    return screenHeight * 0.04.clamp(32, 80);
  }

  static double getFieldSpacing(double screenHeight) {
    return screenHeight * 0.02.clamp(16, 32);
  }

  static double getForgotPasswordSpacing(double screenHeight) {
    return screenHeight * 0.015.clamp(12, 24);
  }

  static double getButtonSpacing(double screenHeight) {
    return screenHeight * 0.025.clamp(20, 40);
  }

  static double getButtonPadding(double screenHeight) {
    if (screenHeight < 600) return 14;
    if (screenHeight < 800) return 16;
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

  static double getFooterPadding(double screenWidth) {
    if (screenWidth < 350) return 16;
    if (screenWidth < 600) return 24;
    return 28;
  }

  static double getFooterFontSize(double screenWidth) {
    if (screenWidth < 350) return 13;
    if (screenWidth < 600) return 14;
    return 15;
  }
}
