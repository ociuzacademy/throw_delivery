// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class RegisterPageDivider extends StatelessWidget {
  const RegisterPageDivider({super.key, required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: isDark ? const Color(0xFF374151) : const Color(0xFFE5E7EB),
      height: 1,
    );
  }
}
