import 'package:flutter/material.dart';
import 'package:throw_delivery/modules/login_module/widgets/login_welcome_section.dart';
import 'google_signin_button.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        // Welcome Section
        const LoginWelcomeSection(),
        const SizedBox(height: 48),

        // Login Form
        GoogleSignInButton(),
      ],
    );
  }
}
