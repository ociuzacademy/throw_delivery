import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/profile_review_module/utils/profile_review_helper.dart';

class ProfileReviewPage extends StatefulWidget {
  const ProfileReviewPage({super.key});

  @override
  State<ProfileReviewPage> createState() => _ProfileReviewPageState();

  static MaterialPageRoute route() => MaterialPageRoute(builder: (_) => ProfileReviewPage());
}

class _ProfileReviewPageState extends State<ProfileReviewPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    // Colors for light and dark mode
    final backgroundColor = isDark ? const Color(0xFF121212) : Colors.white;
    final appBarColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final titleColor = isDark ? Colors.white : const Color(0xFF374151);
    final mainTitleColor = isDark ? Colors.white : const Color(0xFF111827);
    final descriptionColor = isDark
        ? Colors.grey[400]!
        : const Color(0xFF6B7280);
    final shadowColor = isDark
        ? Colors.black.withValues(alpha: 0.3)
        : Colors.black.withValues(alpha: 0.05);

    // Calculate responsive values
    final titleFontSize = ProfileReviewHelper.getTitleFontSize(screenWidth);
    final contentPadding = ProfileReviewHelper.getContentPadding(screenWidth);
    final iconSize = ProfileReviewHelper.getIconSize(screenWidth);
    final mainTitleFontSize = ProfileReviewHelper.getMainTitleFontSize(
      screenWidth,
    );
    final descriptionFontSize = ProfileReviewHelper.getDescriptionFontSize(
      screenWidth,
    );
    final spacing = ProfileReviewHelper.getSpacing(screenWidth);
    final outerCirclePadding = ProfileReviewHelper.getOuterCirclePadding(
      screenWidth,
    );
    final innerCirclePadding = ProfileReviewHelper.getInnerCirclePadding(
      screenWidth,
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Profile Review',
          style: GoogleFonts.inter(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
        elevation: 4,
        shadowColor: shadowColor,
        toolbarHeight: screenWidth < 600 ? 56 : 64,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: backgroundColor,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight:
                    screenHeight -
                    (screenWidth < 600 ? 56 : 64) - // AppBar height
                    MediaQuery.of(context).padding.top - // Status bar
                    MediaQuery.of(context).padding.bottom, // Bottom padding
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated Pulsing Icon
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Container(
                        padding: EdgeInsets.all(outerCirclePadding),
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFF00BFFF,
                          ).withValues(alpha: 0.1 * _animation.value),
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(innerCirclePadding),
                          decoration: BoxDecoration(
                            color: const Color(
                              0xFF00BFFF,
                            ).withValues(alpha: 0.2 * _animation.value),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.access_time,
                            color: const Color(0xFF00BFFF),
                            size: iconSize,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: spacing),

                  // Title
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: contentPadding),
                    child: Text(
                      'Your profile is under review',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: mainTitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: mainTitleColor,
                      ),
                    ),
                  ),
                  SizedBox(height: screenWidth < 600 ? 8 : 12),

                  // Description
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: contentPadding),
                    child: Text(
                      "We're currently reviewing your profile to ensure it meets our standards. This process usually takes 24-48 hours. You'll receive a notification once your profile is approved.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: descriptionFontSize,
                        color: descriptionColor,
                        height: 1.5,
                      ),
                    ),
                  ),

                  // Add extra space for very tall screens
                  if (screenHeight > 800) SizedBox(height: spacing * 0.5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
