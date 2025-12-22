// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';

import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';

class DocumentUploadHelper {
  final BuildContext context;
  final ValueNotifier<File?> frontLicenseImage;
  DocumentUploadHelper({
    required this.context,
    required this.frontLicenseImage,
  });

  Future<void> pickImage(ValueNotifier<File?> imageNotifier) async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
        imageQuality: 90,
      );

      if (pickedFile != null) {
        imageNotifier.value = File(pickedFile.path);
      }
    } catch (e) {
      if (!context.mounted) return;
      CustomSnackbar.showError(
        context: context,
        message: 'Failed to pick image: $e',
      );
    }
  }

  void submitDocuments() {
    if (frontLicenseImage.value == null) {
      CustomSnackbar.showError(
        context: context,
        message: 'Please upload image of your license',
      );

      return;
    }

    final LicenseUploadBloc bloc = context.read<LicenseUploadBloc>();
    bloc.add(LicenseUploadEvent.uploadLicense(image: frontLicenseImage.value!));
  }

  // Responsive helper methods
  static double getContentPadding(double screenWidth) {
    if (screenWidth < 360) return 12;
    if (screenWidth < 600) return 16;
    if (screenWidth < 900) return 20;
    return 24;
  }

  static double getTitleFontSize(double screenWidth) {
    if (screenWidth < 360) return 20;
    if (screenWidth < 600) return 22;
    return 24;
  }

  static double getDescriptionFontSize(double screenWidth) {
    if (screenWidth < 360) return 14;
    if (screenWidth < 600) return 15;
    return 16;
  }

  static double getSectionSpacing(double screenWidth) {
    if (screenWidth < 360) return 16;
    if (screenWidth < 600) return 20;
    return 24;
  }

  static double getButtonFontSize(double screenWidth) {
    if (screenWidth < 360) return 14;
    if (screenWidth < 600) return 15;
    return 16;
  }
}
