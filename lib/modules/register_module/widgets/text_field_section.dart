// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:throw_delivery/modules/register_module/utils/register_helper.dart';
import 'package:throw_delivery/modules/register_module/widgets/custom_text_field_with_label.dart';

class TextFieldSection extends StatefulWidget {
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
  State<TextFieldSection> createState() => _TextFieldSectionState();
}

class _TextFieldSectionState extends State<TextFieldSection> {
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFieldWithLabel(
          controller: widget.nameController,
          focusNode: widget.nameFocusNode,
          label: 'Name',
          hintText: 'Enter your full name',
          isDark: widget.isDark,
          screenWidth: widget.screenWidth,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => widget.emailFocusNode.requestFocus(),
          validator: RegisterHelper.validateName,
        ),
        SizedBox(height: RegisterHelper.getFieldSpacing(widget.screenWidth)),
        CustomTextFieldWithLabel(
          controller: widget.emailController,
          focusNode: widget.emailFocusNode,
          label: 'Email',
          hintText: 'ethan.carter@example.com',
          isDark: widget.isDark,
          screenWidth: widget.screenWidth,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => widget.phoneFocusNode.requestFocus(),
          validator: RegisterHelper.validateEmail,
        ),
        SizedBox(height: RegisterHelper.getFieldSpacing(widget.screenWidth)),
        CustomTextFieldWithLabel(
          controller: widget.phoneController,
          focusNode: widget.phoneFocusNode,
          label: 'Phone Number',
          hintText: '+1 (555) 123-4567',
          isDark: widget.isDark,
          screenWidth: widget.screenWidth,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => widget.passwordFocusNode.requestFocus(),
          validator: RegisterHelper.validatePhone,
        ),
        SizedBox(height: RegisterHelper.getFieldSpacing(widget.screenWidth)),
        ValueListenableBuilder(
          valueListenable: _isPasswordVisible,
          builder: (context, isPasswordVisible, child) {
            return CustomTextFieldWithLabel(
              controller: widget.passwordController,
              focusNode: widget.passwordFocusNode,
              label: 'Password',
              hintText: 'Enter password',
              isDark: widget.isDark,
              screenWidth: widget.screenWidth,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              suffixIcon: IconButton(
                onPressed: () {
                  _isPasswordVisible.value = !isPasswordVisible;
                },
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: const Color(0xFF9CA3AF),
                  size: RegisterHelper.getIconSize(widget.screenWidth),
                ),
              ),
              isObscure: isPasswordVisible,
              onFieldSubmitted: (_) =>
                  widget.vehicleTypeFocusNode.requestFocus(),
              validator: RegisterHelper.validatePassword,
            );
          },
        ),
      ],
    );
  }
}
