// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/onboarding_module/models/onboarding_slide.dart';
import 'package:throw_delivery/modules/onboarding_module/utils/onboarding_helper.dart';

class Slide extends StatelessWidget {
  const Slide({super.key, required this.slide});
  final OnboardingSlide slide;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(
              OnboardingHelper.getContentPadding(screenWidth),
            ),
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon Circle
                Container(
                  width: OnboardingHelper.getIconContainerSize(
                    screenWidth,
                    screenHeight,
                  ),
                  height: OnboardingHelper.getIconContainerSize(
                    screenWidth,
                    screenHeight,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F2FE), // sky-100 equivalent
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.05),
                        blurRadius: 2,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Icon(
                    slide.icon,
                    color: const Color(0xFF00BFFF),
                    size: OnboardingHelper.getIconSize(
                      screenWidth,
                      screenHeight,
                    ),
                  ),
                ),

                SizedBox(
                  height: OnboardingHelper.getVerticalSpacing(
                    screenWidth,
                    screenHeight,
                  ),
                ),

                // Title
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    slide.title,
                    style: GoogleFonts.poppins(
                      fontSize: OnboardingHelper.getTitleFontSize(screenWidth),
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(
                  height: OnboardingHelper.getDescriptionSpacing(screenWidth),
                ),

                // Description
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: OnboardingHelper.getDescriptionPadding(
                      screenWidth,
                    ),
                  ),
                  child: Text(
                    slide.description,
                    style: GoogleFonts.inter(
                      fontSize: OnboardingHelper.getDescriptionFontSize(
                        screenWidth,
                      ),
                      color: Theme.of(context).brightness == Brightness.dark
                          ? const Color(0xFF9CA3AF)
                          : const Color(0xFF6B7280),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
