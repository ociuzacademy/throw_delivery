// custom_text_field_with_label.dart (updated)
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/typedefs/validate_text_form_input.dart';
import 'package:throw_delivery/core/widgets/text_field/custom_text_field.dart';
import 'package:throw_delivery/modules/vehicle_register_module/utils/vehicle_register_helper.dart';

class CustomTextFieldWithLabel extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String label;
  final String hintText;
  final bool isDark;
  final double screenWidth;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? suffixIcon;
  final bool isObscure;
  final ValidateTextFormInput validator;
  final bool enabled;

  const CustomTextFieldWithLabel({
    super.key,
    required this.controller,
    this.focusNode,
    required this.label,
    required this.hintText,
    required this.isDark,
    required this.screenWidth,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.isObscure = false,
    this.validator,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: VehicleRegisterHelper.getLabelFontSize(screenWidth),
            fontWeight: FontWeight.w500,
            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
          ),
        ),
        SizedBox(height: VehicleRegisterHelper.getLabelSpacing(screenWidth)),
        CustomTextField(
          controller: controller,
          focusNode: focusNode,
          hintText: hintText,
          isDark: isDark,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          suffixIcon: suffixIcon,
          obscureText: isObscure,
          validator: validator,
          enabled: enabled,
        ),
      ],
    );
  }
}
