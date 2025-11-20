// register_provider.dart
import 'dart:io';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  // Form state
  File? _profileImage;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _vehicleTypeController = TextEditingController();
  final TextEditingController _vehicleModelController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();

  // Focus nodes
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _vehicleTypeFocusNode = FocusNode();
  final FocusNode _vehicleModelFocusNode = FocusNode();
  final FocusNode _licensePlateFocusNode = FocusNode();

  // Password visibility
  bool _isPasswordVisible = false;

  // Getters
  File? get profileImage => _profileImage;
  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get vehicleTypeController => _vehicleTypeController;
  TextEditingController get vehicleModelController => _vehicleModelController;
  TextEditingController get licensePlateController => _licensePlateController;

  FocusNode get nameFocusNode => _nameFocusNode;
  FocusNode get emailFocusNode => _emailFocusNode;
  FocusNode get phoneFocusNode => _phoneFocusNode;
  FocusNode get passwordFocusNode => _passwordFocusNode;
  FocusNode get vehicleTypeFocusNode => _vehicleTypeFocusNode;
  FocusNode get vehicleModelFocusNode => _vehicleModelFocusNode;
  FocusNode get licensePlateFocusNode => _licensePlateFocusNode;

  bool get isPasswordVisible => _isPasswordVisible;

  // Setters
  void setProfileImage(File? image) {
    _profileImage = image;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  // Form validation methods
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    if (value.length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
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

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    final phoneRegex = RegExp(r'^\+?[\d\s\-\(\)]{10,}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  String? validateVehicleType(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter vehicle type';
    }
    return null;
  }

  String? validateVehicleModel(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter vehicle model';
    }
    return null;
  }

  String? validateLicensePlate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter license plate';
    }
    return null;
  }

  // Check if form is valid
  bool isFormValid(GlobalKey<FormState> formKey) {
    return formKey.currentState?.validate() ?? false;
  }

  // Clear all data
  void clearAll() {
    _profileImage = null;
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _passwordController.clear();
    _vehicleTypeController.clear();
    _vehicleModelController.clear();
    _licensePlateController.clear();
    _isPasswordVisible = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _vehicleTypeController.dispose();
    _vehicleModelController.dispose();
    _licensePlateController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _vehicleTypeFocusNode.dispose();
    _vehicleModelFocusNode.dispose();
    _licensePlateFocusNode.dispose();
    super.dispose();
  }
}
