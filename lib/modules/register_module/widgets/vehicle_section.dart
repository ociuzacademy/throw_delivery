// vehicle_section.dart (updated)
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:throw_delivery/modules/register_module/providers/register_provider.dart';
import 'package:throw_delivery/modules/register_module/utils/register_helper.dart';
import 'package:throw_delivery/modules/register_module/widgets/custom_text_field_with_label.dart';

class VehicleSection extends StatelessWidget {
  final bool isDark;
  final double screenWidth;
  final TextEditingController vehicleTypeController;
  final TextEditingController vehicleModelController;
  final TextEditingController licensePlateController;
  final FocusNode vehicleTypeFocusNode;
  final FocusNode vehicleModelFocusNode;
  final FocusNode licensePlateFocusNode;
  final VoidCallback register;

  const VehicleSection({
    super.key,
    required this.isDark,
    required this.screenWidth,
    required this.vehicleTypeController,
    required this.vehicleModelController,
    required this.licensePlateController,
    required this.vehicleTypeFocusNode,
    required this.vehicleModelFocusNode,
    required this.licensePlateFocusNode,
    required this.register,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context);

    return Column(
      children: [
        CustomTextFieldWithLabel(
          controller: vehicleTypeController,
          focusNode: vehicleTypeFocusNode,
          label: 'Vehicle Type',
          hintText: 'e.g., Motorcycle, Car, Van',
          isDark: isDark,
          screenWidth: screenWidth,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => vehicleModelFocusNode.requestFocus(),
          validator: provider.validateVehicleType,
        ),
        SizedBox(height: RegisterHelper.getFieldSpacing(screenWidth)),
        CustomTextFieldWithLabel(
          controller: vehicleModelController,
          focusNode: vehicleModelFocusNode,
          label: 'Vehicle Make & Model',
          hintText: 'e.g., Yamaha NMAX',
          isDark: isDark,
          screenWidth: screenWidth,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => licensePlateFocusNode.requestFocus(),
          validator: provider.validateVehicleModel,
        ),
        SizedBox(height: RegisterHelper.getFieldSpacing(screenWidth)),
        CustomTextFieldWithLabel(
          controller: licensePlateController,
          focusNode: licensePlateFocusNode,
          label: 'License Plate',
          hintText: 'e.g., SGN-1234',
          isDark: isDark,
          screenWidth: screenWidth,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => register(),
          validator: provider.validateLicensePlate,
        ),
      ],
    );
  }
}
