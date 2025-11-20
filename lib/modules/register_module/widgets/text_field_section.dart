// text_field_section.dart (updated)
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:throw_delivery/modules/register_module/providers/register_provider.dart';
import 'package:throw_delivery/modules/register_module/utils/register_helper.dart';
import 'package:throw_delivery/modules/register_module/widgets/custom_text_field_with_label.dart';

class TextFieldSection extends StatelessWidget {
  final bool isDark;
  final double screenWidth;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final FocusNode nameFocusNode;
  final FocusNode emailFocusNode;
  final FocusNode phoneFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode vehicleTypeFocusNode;

  const TextFieldSection({
    super.key,
    required this.isDark,
    required this.screenWidth,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.nameFocusNode,
    required this.emailFocusNode,
    required this.phoneFocusNode,
    required this.passwordFocusNode,
    required this.vehicleTypeFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RegisterProvider>(context);

    return Column(
      children: [
        CustomTextFieldWithLabel(
          controller: nameController,
          focusNode: nameFocusNode,
          label: 'Name',
          hintText: 'Enter your full name',
          isDark: isDark,
          screenWidth: screenWidth,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => emailFocusNode.requestFocus(),
          validator: provider.validateName,
        ),
        SizedBox(height: RegisterHelper.getFieldSpacing(screenWidth)),
        CustomTextFieldWithLabel(
          controller: emailController,
          focusNode: emailFocusNode,
          label: 'Email',
          hintText: 'ethan.carter@example.com',
          isDark: isDark,
          screenWidth: screenWidth,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => phoneFocusNode.requestFocus(),
          validator: provider.validateEmail,
        ),
        SizedBox(height: RegisterHelper.getFieldSpacing(screenWidth)),
        CustomTextFieldWithLabel(
          controller: phoneController,
          focusNode: phoneFocusNode,
          label: 'Phone Number',
          hintText: '+1 (555) 123-4567',
          isDark: isDark,
          screenWidth: screenWidth,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => passwordFocusNode.requestFocus(),
          validator: provider.validatePhone,
        ),
        SizedBox(height: RegisterHelper.getFieldSpacing(screenWidth)),
        CustomTextFieldWithLabel(
          controller: passwordController,
          focusNode: passwordFocusNode,
          label: 'Password',
          hintText: 'Enter password',
          isDark: isDark,
          screenWidth: screenWidth,
          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.next,
          suffixIcon: IconButton(
            onPressed: provider.togglePasswordVisibility,
            icon: Icon(
              provider.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: const Color(0xFF9CA3AF),
              size: RegisterHelper.getIconSize(screenWidth),
            ),
          ),
          isObscure: !provider.isPasswordVisible,
          onFieldSubmitted: (_) => vehicleTypeFocusNode.requestFocus(),
          validator: provider.validatePassword,
        ),
      ],
    );
  }
}
