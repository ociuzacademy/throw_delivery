import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:throw_delivery/core/theme/app_colors.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDarkMode
              ? Colors.white.withValues(alpha: 0.1)
              : AppColors.primary,
          foregroundColor: isDarkMode
              ? AppColors.primary
              : AppColors.lightBackground,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: isDarkMode ? AppColors.darkBackground : AppColors.primary,
              width: 2,
            ),
          ),
          elevation: 2,
          shadowColor: Colors.black.withValues(alpha: 0.1),
          alignment: Alignment.center,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.string(_googleLogoSvg),
            const SizedBox(width: 12),
            const Text(
              'Sign in with Google',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  static const String _googleLogoSvg = '''
    <svg width="24" height="24" viewBox="0 0 48 48" xmlns="http://www.w3.org/2000/svg">
      <path d="M43.611 20.083H42V20H24v8h11.303c-1.649 4.657-6.08 8-11.303 8c-6.627 0-12-5.373-12-12s5.373-12 12-12c3.059 0 5.842 1.154 7.961 3.039l5.657-5.657C34.046 6.053 29.268 4 24 4C12.955 4 4 12.955 4 24s8.955 20 20 20s20-8.955 20-20c0-1.341-.138-2.65-.389-3.917z" fill="#FFC107"/>
      <path d="M6.306 14.691l6.571 4.819C14.655 15.108 18.961 12 24 12c3.059 0 5.842 1.154 7.961 3.039l5.657-5.657C34.046 6.053 29.268 4 24 4C16.318 4 9.656 8.337 6.306 14.691z" fill="#FF3D00"/>
      <path d="M24 44c5.166 0 9.86-1.977 13.409-5.192l-6.19-5.238A11.91 11.91 0 0 1 24 36c-5.213 0-9.636-3.328-11.296-7.969l-6.556 4.846C9.626 39.695 16.301 44 24 44z" fill="#4CAF50"/>
      <path d="M43.611 20.083L43.595 20H24v8h11.303a12.04 12.04 0 0 1-4.087 5.571l.003-.002l6.19 5.238C36.971 39.205 44 34 44 24c0-1.341-.138-2.65-.389-3.917z" fill="#1976D2"/>
    </svg>
  ''';
}
