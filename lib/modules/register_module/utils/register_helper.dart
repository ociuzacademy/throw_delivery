// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_delivery/modules/document_upload_module/view/document_upload_page.dart';

class RegisterHelper {
  final BuildContext context;
  final ValueNotifier<File?> profileImage;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController vehicleTypeController;
  final TextEditingController vehicleModelController;
  final TextEditingController licensePlateController;
  const RegisterHelper({
    required this.context,
    required this.profileImage,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.vehicleTypeController,
    required this.vehicleModelController,
    required this.licensePlateController,
  });
  Future<void> pickImage() async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      final XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );
      if (image != null) {
        profileImage.value = File(image.path);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      // Show error message to user
      if (!context.mounted) return;
      CustomSnackbar.showError(
        context: context,
        message: 'Failed to pick image: $e',
      );
    }
  }

  void register() {
    // Unfocus any focused text field
    FocusScope.of(context).unfocus();

    if (formKey.currentState!.validate()) {
      if (profileImage.value != null) {
        // Validate and save profile data
        final String name = nameController.text.trim();
        final String email = emailController.text.trim();
        final String phone = phoneController.text.trim();
        final String password = passwordController.text.trim();
        final String vehicleType = vehicleTypeController.text.trim();
        final String vehicleModel = vehicleModelController.text.trim();
        final String licensePlate = licensePlateController.text.trim();

        debugPrint('Profile Setup Completed');
        debugPrint('Name: $name');
        debugPrint('Email: $email');
        debugPrint('Phone: $phone');
        debugPrint('Password: $password');
        debugPrint('Vehicle Type: $vehicleType');
        debugPrint('Vehicle Model: $vehicleModel');
        debugPrint('License Plate: $licensePlate');

        CustomSnackbar.showSuccess(
          context: context,
          message: 'Profile register completed!',
        );

        Navigator.pushReplacement(context, DocumentUploadPage.route());
      } else {
        CustomSnackbar.showError(
          context: context,
          message: 'Please upload your profile image',
        );
      }
    } else {
      CustomSnackbar.showError(
        context: context,
        message: 'Please fill all the details',
      );
    }
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

  // Add these validation methods to your RegisterHelper class

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]{10,}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? validateVehicleType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter vehicle type';
    }
    return null;
  }

  static String? validateVehicleModel(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter vehicle model';
    }
    return null;
  }

  static String? validateLicensePlate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter license plate';
    }
    return null;
  }
}
