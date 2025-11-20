// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:throw_delivery/modules/onboarding_module/models/onboarding_slide.dart';
import 'package:throw_delivery/modules/onboarding_module/utils/onboarding_helper.dart';
import 'package:throw_delivery/modules/onboarding_module/widgets/slide.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();

  static MaterialPageRoute route() => MaterialPageRoute(builder: (_) => OnboardingPage());
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final OnboardingHelper _onboardingHelper;
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  final List<OnboardingSlide> _slides = [
    OnboardingSlide(
      icon: Icons.gavel,
      title: 'Bid on Requests',
      description:
          'Browse nearby delivery requests and place your competitive bids.',
    ),
    OnboardingSlide(
      icon: Icons.local_shipping,
      title: 'Deliver with Confidence',
      description:
          'Navigate routes efficiently and update delivery statuses in real-time.',
    ),
    OnboardingSlide(
      icon: Icons.security,
      title: 'Earn Securely',
      description:
          'Receive payments safely through our integrated Escrow system.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _onboardingHelper = OnboardingHelper(
      context: context,
      pageController: _pageController,
      currentPage: _currentPage,
      slides: _slides,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 350;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0f1c23) : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Main Content with PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _slides.length,
                onPageChanged: (int page) {
                  _currentPage.value = page;
                },
                itemBuilder: (context, index) {
                  return Slide(slide: _slides[index]);
                },
              ),
            ),

            // Footer with dots and button
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: OnboardingHelper.getResponsivePadding(
                  screenSize.width,
                ),
                vertical: isSmallScreen ? 16 : 24,
              ),
              constraints: BoxConstraints(
                maxWidth: OnboardingHelper.getMaxContainerWidth(
                  screenSize.width,
                ),
              ),
              child: Column(
                children: [
                  // Dots Indicator
                  ValueListenableBuilder<int>(
                    valueListenable: _currentPage,
                    builder: (context, page, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_slides.length, (index) {
                          return Container(
                            width: OnboardingHelper.getDotSize(
                              screenSize.width,
                            ),
                            height: OnboardingHelper.getDotSize(
                              screenSize.width,
                            ),
                            margin: EdgeInsets.symmetric(
                              horizontal: OnboardingHelper.getDotMargin(
                                screenSize.width,
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: page == index
                                  ? const Color(0xFF00BFFF)
                                  : const Color(0xFFD1D5DB),
                              shape: BoxShape.circle,
                            ),
                          );
                        }),
                      );
                    },
                  ),

                  SizedBox(
                    height: OnboardingHelper.getSpacing(screenSize.width),
                  ),

                  // Next Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onboardingHelper.nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00BFFF),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          vertical: OnboardingHelper.getButtonPadding(
                            screenSize.width,
                          ),
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            OnboardingHelper.getBorderRadius(screenSize.width),
                          ),
                        ),
                        elevation: 4,
                        shadowColor: Colors.black.withValues(alpha: 0.1),
                      ),
                      child: ValueListenableBuilder<int>(
                        valueListenable: _currentPage,
                        builder: (context, page, _) => Text(
                          page == _slides.length - 1 ? 'Get Started' : 'Next',
                          style: GoogleFonts.inter(
                            fontSize: OnboardingHelper.getButtonFontSize(
                              screenSize.width,
                            ),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
