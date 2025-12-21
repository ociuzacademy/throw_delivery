// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';

class VehicleRegisterHelper {
  final BuildContext context;
  const VehicleRegisterHelper({required this.context});

  void deliveryAgentProfileInit() {
    final DeliveryAgentProfileCubit deliveryAgentProfileCubit = context
        .read<DeliveryAgentProfileCubit>();
    deliveryAgentProfileCubit.getDeliveryAgentProfile();
  }

  // Responsive helper methods
  static double getHeaderPadding(double screenWidth) {
    if (screenWidth < 350) return 12;
    if (screenWidth < 600) return 16;
    return 20;
  }

  static double getIconSize(double screenWidth) {
    if (screenWidth < 350) return 18;
    if (screenWidth < 600) return 20;
    return 22;
  }

  static double getTitleFontSize(double screenWidth) {
    if (screenWidth < 350) return 16;
    if (screenWidth < 600) return 18;
    return 20;
  }

  static double getContentPadding(double screenWidth) {
    if (screenWidth < 350) return 16;
    if (screenWidth < 600) return 20;
    return 24;
  }

  static double getMaxContainerWidth(double screenWidth) {
    if (screenWidth < 350) return 320;
    if (screenWidth < 600) return 400;
    return 500;
  }

  static double getProfileImageSize(double screenWidth) {
    if (screenWidth < 350) return 100;
    if (screenWidth < 600) return 128;
    return 150;
  }

  static double getCameraButtonSize(double screenWidth) {
    if (screenWidth < 350) return 32;
    if (screenWidth < 600) return 36;
    return 40;
  }

  static double getCameraIconSize(double screenWidth) {
    if (screenWidth < 350) return 16;
    if (screenWidth < 600) return 18;
    return 20;
  }

  static double getProfileTextSpacing(double screenWidth) {
    if (screenWidth < 350) return 12;
    if (screenWidth < 600) return 16;
    return 20;
  }

  static double getRoleFontSize(double screenWidth) {
    if (screenWidth < 350) return 14;
    if (screenWidth < 600) return 16;
    return 18;
  }

  static double getSectionSpacing(double screenWidth) {
    if (screenWidth < 350) return 24;
    if (screenWidth < 600) return 32;
    return 40;
  }

  static double getCardPadding(double screenWidth) {
    if (screenWidth < 350) return 16;
    if (screenWidth < 600) return 20;
    return 24;
  }

  static double getSectionTitleFontSize(double screenWidth) {
    if (screenWidth < 350) return 16;
    if (screenWidth < 600) return 18;
    return 20;
  }

  static double getFieldSpacing(double screenWidth) {
    if (screenWidth < 350) return 12;
    if (screenWidth < 600) return 16;
    return 20;
  }

  static double getDividerSpacing(double screenWidth) {
    if (screenWidth < 350) return 16;
    if (screenWidth < 600) return 20;
    return 24;
  }

  static double getLabelFontSize(double screenWidth) {
    if (screenWidth < 350) return 12;
    if (screenWidth < 600) return 14;
    return 15;
  }

  static double getLabelSpacing(double screenWidth) {
    if (screenWidth < 350) return 4;
    if (screenWidth < 600) return 6;
    return 8;
  }

  static double getBorderRadius(double screenWidth) {
    if (screenWidth < 350) return 10;
    if (screenWidth < 600) return 12;
    return 14;
  }

  static double getFooterPadding(double screenWidth) {
    if (screenWidth < 350) return 16;
    if (screenWidth < 600) return 20;
    return 24;
  }

  static double getButtonPadding(double screenWidth) {
    if (screenWidth < 350) return 14;
    if (screenWidth < 600) return 16;
    return 18;
  }

  static double getButtonFontSize(double screenWidth) {
    if (screenWidth < 350) return 14;
    if (screenWidth < 600) return 16;
    return 18;
  }
}
