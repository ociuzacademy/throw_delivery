// text_field_section.dart (updated)
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_delivery/modules/vehicle_register_module/utils/vehicle_register_helper.dart';
import 'package:throw_delivery/modules/vehicle_register_module/widgets/custom_text_field_with_label.dart';

class TextFieldSection extends StatelessWidget {
  final bool isDark;
  final double screenWidth;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const TextFieldSection({
    super.key,
    required this.isDark,
    required this.screenWidth,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldWithLabel(
          controller: nameController,
          label: 'Name',
          hintText: 'Enter your full name',
          isDark: isDark,
          screenWidth: screenWidth,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {},
          enabled: false,
        ),
        SizedBox(height: VehicleRegisterHelper.getFieldSpacing(screenWidth)),
        CustomTextFieldWithLabel(
          controller: emailController,
          label: 'Email',
          hintText: 'Enter your email',
          isDark: isDark,
          screenWidth: screenWidth,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {},
          enabled: false,
        ),
        SizedBox(height: VehicleRegisterHelper.getFieldSpacing(screenWidth)),
        CustomTextFieldWithLabel(
          controller: phoneController,
          label: 'Phone Number',
          hintText: 'Enter your phone number',
          isDark: isDark,
          screenWidth: screenWidth,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) {},
          enabled: false,
        ),
      ],
    );
  }
}
