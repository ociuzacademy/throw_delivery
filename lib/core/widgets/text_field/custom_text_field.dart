import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/typedefs/validate_text_form_input.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hintText;
  final bool isDark;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final ValidateTextFormInput validator;
  final ValueChanged<String>? onFieldSubmitted;
  final Widget? suffixIcon;
  final Widget? prefix;
  final int? maxLines;
  final bool enabled;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    super.key,
    required this.controller,
    this.focusNode,
    required this.hintText,
    required this.isDark,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefix,
    this.maxLines = 1,
    this.enabled = true,
    this.textStyle,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(_getBorderRadius(screenWidth)),
        border: Border.all(
          color: isDark ? const Color(0xFF374151) : const Color(0xFFE5E7EB),
          width: 2,
        ),
      ),
      child: TextFormField(
        controller: controller,
        focusNode: focusNode,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        maxLines: maxLines,
        enabled: enabled,
        style:
            textStyle ??
            GoogleFonts.inter(
              color: isDark ? Colors.white : const Color(0xFF111827),
              fontSize: _getFontSize(screenWidth),
            ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.inter(
            color: const Color(0xFF9CA3AF),
            fontSize: _getFontSize(screenWidth),
          ),
          contentPadding:
              contentPadding ??
              EdgeInsets.symmetric(
                horizontal: _getHorizontalPadding(screenWidth),
                vertical: _getVerticalPadding(screenWidth),
              ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          suffixIcon: suffixIcon,
          prefix: prefix,
          errorStyle: GoogleFonts.inter(
            fontSize: _getErrorFontSize(screenWidth),
            color: Colors.red,
          ),
        ),
      ),
    );
  }

  double _getFontSize(double screenWidth) {
    if (screenWidth < 350) return 14;
    if (screenWidth < 600) return 16;
    return 17;
  }

  double _getErrorFontSize(double screenWidth) {
    if (screenWidth < 350) return 12;
    if (screenWidth < 600) return 13;
    return 14;
  }

  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth < 350) return 14;
    if (screenWidth < 600) return 16;
    return 18;
  }

  double _getVerticalPadding(double screenWidth) {
    if (screenWidth < 350) return 14;
    if (screenWidth < 600) return 16;
    return 18;
  }

  double _getBorderRadius(double screenWidth) {
    if (screenWidth < 350) return 10;
    if (screenWidth < 600) return 12;
    return 14;
  }
}
