// register_provider.dart
import 'package:flutter/material.dart';
import 'package:throw_delivery/core/models/delivery_agent_model.dart';
import 'package:throw_delivery/modules/vehicle_register_module/classes/vehicle_data.dart';

class RegisterProvider extends ChangeNotifier {
  // Form state
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _vehicleTypeController = TextEditingController();
  final TextEditingController _vehicleModelController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();

  // Focus nodes
  final FocusNode _vehicleTypeFocusNode = FocusNode();
  final FocusNode _vehicleModelFocusNode = FocusNode();
  final FocusNode _licensePlateFocusNode = FocusNode();

  // Profile image
  String? _profileImage;

  // Getters
  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneController => _phoneController;
  TextEditingController get vehicleTypeController => _vehicleTypeController;
  TextEditingController get vehicleModelController => _vehicleModelController;
  TextEditingController get licensePlateController => _licensePlateController;

  FocusNode get vehicleTypeFocusNode => _vehicleTypeFocusNode;
  FocusNode get vehicleModelFocusNode => _vehicleModelFocusNode;
  FocusNode get licensePlateFocusNode => _licensePlateFocusNode;

  String? get profileImage => _profileImage;

  // Setters
  void userDetailsInitFromApi(DeliveryAgentModel deliveryAgent) {
    _nameController.text = deliveryAgent.displayName;
    _emailController.text = deliveryAgent.email;
    _phoneController.text = deliveryAgent.phoneNumber;
    _vehicleTypeController.text = deliveryAgent.vehicleType ?? '';
    _vehicleModelController.text = deliveryAgent.vehicleModel ?? '';
    _licensePlateController.text = deliveryAgent.vehicleNumber ?? '';
    _profileImage = deliveryAgent.photoUrl;
    notifyListeners();
  }

  // Form validation methods

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

  VehicleData get vehicleData => VehicleData(
    vehicleType: _vehicleTypeController.text.trim(),
    vehicleModel: _vehicleModelController.text.trim(),
    vehicleNumber: _licensePlateController.text.trim(),
  );

  // Clear all data
  void clearAll() {
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    _vehicleTypeController.clear();
    _vehicleModelController.clear();
    _licensePlateController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _vehicleTypeController.dispose();
    _vehicleModelController.dispose();
    _licensePlateController.dispose();
    _vehicleTypeFocusNode.dispose();
    _vehicleModelFocusNode.dispose();
    _licensePlateFocusNode.dispose();
    super.dispose();
  }
}
