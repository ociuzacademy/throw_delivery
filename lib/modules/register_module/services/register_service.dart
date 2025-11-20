// register_service.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_delivery/modules/document_upload_module/view/document_upload_page.dart';
import 'package:throw_delivery/modules/register_module/providers/register_provider.dart';

class RegisterService {
  final BuildContext context;

  RegisterService(this.context);

  Future<void> pickImage(RegisterProvider provider) async {
    try {
      final ImagePicker imagePicker = ImagePicker();
      final XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 85,
      );
      if (image != null) {
        provider.setProfileImage(File(image.path));
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      if (!context.mounted) return;
      CustomSnackbar.showError(
        context: context,
        message: 'Failed to pick image: $e',
      );
    }
  }

  void register(RegisterProvider provider, GlobalKey<FormState> formKey) {
    // Unfocus any focused text field
    FocusScope.of(context).unfocus();

    if (provider.isFormValid(formKey)) {
      if (provider.profileImage != null) {
        // Validate and save profile data
        final String name = provider.nameController.text.trim();
        final String email = provider.emailController.text.trim();
        final String phone = provider.phoneController.text.trim();
        final String password = provider.passwordController.text.trim();
        final String vehicleType = provider.vehicleTypeController.text.trim();
        final String vehicleModel = provider.vehicleModelController.text.trim();
        final String licensePlate = provider.licensePlateController.text.trim();

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
}
