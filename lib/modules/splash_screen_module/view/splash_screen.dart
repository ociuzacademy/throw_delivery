import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/splash_screen_module/utils/splash_screen_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashScreenHelper _splashScreenHelper;
  late final Timer _navigationTimer;

  @override
  void initState() {
    super.initState();
    _splashScreenHelper = SplashScreenHelper(context: context);
    // Set up timer to navigate after 3 seconds
    _navigationTimer = Timer(
      const Duration(seconds: 3),
      _splashScreenHelper.navigateToNextPage,
    );
  }

  @override
  void dispose() {
    _navigationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0f1c23) : Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Get screen dimensions
          final screenWidth = constraints.maxWidth;

          // Calculate responsive sizes based on screen dimensions
          final iconSize = SplashScreenHelper.getResponsiveValue(
            screenWidth: screenWidth,
            small: 80.0,
            normal: 112.0,
            large: 140.0,
          );

          final iconContainerSize = SplashScreenHelper.getResponsiveValue(
            screenWidth: screenWidth,
            small: 80.0,
            normal: 112.0,
            large: 140.0,
          );

          final titleFontSize = SplashScreenHelper.getResponsiveValue(
            screenWidth: screenWidth,
            small: 36.0,
            normal: 48.0,
            large: 56.0,
          );

          final subtitleFontSize = SplashScreenHelper.getResponsiveValue(
            screenWidth: screenWidth,
            small: 16.0,
            normal: 18.0,
            large: 20.0,
          );

          final verticalSpacing = SplashScreenHelper.getResponsiveValue(
            screenWidth: screenWidth,
            small: 24.0,
            normal: 32.0,
            large: 40.0,
          );

          final smallVerticalSpacing = SplashScreenHelper.getResponsiveValue(
            screenWidth: screenWidth,
            small: 8.0,
            normal: 12.0,
            large: 16.0,
          );

          final borderRadius = SplashScreenHelper.getResponsiveValue(
            screenWidth: screenWidth,
            small: 12.0,
            normal: 16.0,
            large: 20.0,
          );

          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(
                  SplashScreenHelper.getResponsiveValue(
                    screenWidth: screenWidth,
                    small: 16.0,
                    normal: 20.0,
                    large: 24.0,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon Container
                    Container(
                      width: iconContainerSize,
                      height: iconContainerSize,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00BFFF),
                        borderRadius: BorderRadius.circular(borderRadius),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.bolt,
                        color: Colors.white,
                        size: iconSize,
                      ),
                    ),

                    SizedBox(height: verticalSpacing),

                    // Title
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Throw',
                        style: GoogleFonts.inter(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF00BFFF),
                        ),
                      ),
                    ),

                    SizedBox(height: smallVerticalSpacing),

                    // Subtitle
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Deliver. Earn. Repeat.',
                        style: GoogleFonts.inter(
                          fontSize: subtitleFontSize,
                          color: isDark
                              ? const Color(0xFFF9FAFB)
                              : const Color(0xFF6B7280),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
