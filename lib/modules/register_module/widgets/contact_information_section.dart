// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:throw_delivery/modules/register_module/utils/register_helper.dart';
import 'package:throw_delivery/modules/register_module/widgets/register_page_divider.dart';
import 'package:throw_delivery/modules/register_module/widgets/section_title.dart';
import 'package:throw_delivery/modules/register_module/widgets/text_field_section.dart';
import 'package:throw_delivery/modules/register_module/widgets/vehicle_section.dart';

class ContactInformationSection extends StatelessWidget {
  final bool isDark;
  final double screenWidth;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController vehicleTypeController;
  final TextEditingController vehicleModelController;
  final TextEditingController licensePlateController;
  final FocusNode nameFocusNode;
  final FocusNode emailFocusNode;
  final FocusNode phoneFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode vehicleTypeFocusNode;
  final FocusNode vehicleModelFocusNode;
  final FocusNode licensePlateFocusNode;
  final VoidCallback register;
  const ContactInformationSection({
    super.key,
    required this.isDark,
    required this.screenWidth,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.vehicleTypeController,
    required this.vehicleModelController,
    required this.licensePlateController,
    required this.nameFocusNode,
    required this.emailFocusNode,
    required this.phoneFocusNode,
    required this.passwordFocusNode,
    required this.vehicleTypeFocusNode,
    required this.vehicleModelFocusNode,
    required this.licensePlateFocusNode,
    required this.register,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(RegisterHelper.getCardPadding(screenWidth)),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(
          RegisterHelper.getBorderRadius(screenWidth),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Contact Information
          SectionTitle(
            title: 'Contact Information',
            isDark: isDark,
            screenWidth: screenWidth,
          ),
          SizedBox(height: RegisterHelper.getFieldSpacing(screenWidth)),
          TextFieldSection(
            isDark: isDark,
            screenWidth: screenWidth,
            nameController: nameController,
            emailController: emailController,
            phoneController: phoneController,
            passwordController: passwordController,
            nameFocusNode: nameFocusNode,
            emailFocusNode: emailFocusNode,
            phoneFocusNode: phoneFocusNode,
            passwordFocusNode: passwordFocusNode,
            vehicleTypeFocusNode: vehicleTypeFocusNode,
          ),
          SizedBox(height: RegisterHelper.getDividerSpacing(screenWidth)),
          RegisterPageDivider(isDark: isDark),
          SizedBox(height: RegisterHelper.getDividerSpacing(screenWidth)),
          // Vehicle Details
          SectionTitle(
            title: 'Vehicle Details',
            isDark: isDark,
            screenWidth: screenWidth,
          ),
          SizedBox(height: RegisterHelper.getFieldSpacing(screenWidth)),
          VehicleSection(
            isDark: isDark,
            screenWidth: screenWidth,
            vehicleTypeController: vehicleTypeController,
            vehicleModelController: vehicleModelController,
            licensePlateController: licensePlateController,
            vehicleTypeFocusNode: vehicleTypeFocusNode,
            vehicleModelFocusNode: vehicleModelFocusNode,
            licensePlateFocusNode: licensePlateFocusNode,
            register: register,
          ),
        ],
      ),
    );
  }
}
