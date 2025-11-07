class ProfileReviewHelper {
  // Responsive helper methods
  static double getTitleFontSize(double screenWidth) {
    if (screenWidth < 360) return 18;
    if (screenWidth < 600) return 20;
    if (screenWidth < 900) return 22;
    return 24;
  }

  static double getContentPadding(double screenWidth) {
    if (screenWidth < 360) return 16;
    if (screenWidth < 600) return 20;
    if (screenWidth < 900) return 24;
    return 32;
  }

  static double getIconSize(double screenWidth) {
    if (screenWidth < 360) return 48;
    if (screenWidth < 600) return 56;
    if (screenWidth < 900) return 64;
    return 72;
  }

  static double getMainTitleFontSize(double screenWidth) {
    if (screenWidth < 360) return 20;
    if (screenWidth < 600) return 22;
    if (screenWidth < 900) return 24;
    return 28;
  }

  static double getDescriptionFontSize(double screenWidth) {
    if (screenWidth < 360) return 14;
    if (screenWidth < 600) return 15;
    if (screenWidth < 900) return 16;
    return 18;
  }

  static double getSpacing(double screenWidth) {
    if (screenWidth < 360) return 24;
    if (screenWidth < 600) return 28;
    if (screenWidth < 900) return 32;
    return 36;
  }

  static double getOuterCirclePadding(double screenWidth) {
    if (screenWidth < 360) return 16;
    if (screenWidth < 600) return 20;
    if (screenWidth < 900) return 24;
    return 28;
  }

  static double getInnerCirclePadding(double screenWidth) {
    if (screenWidth < 360) return 12;
    if (screenWidth < 600) return 14;
    if (screenWidth < 900) return 16;
    return 20;
  }
}
