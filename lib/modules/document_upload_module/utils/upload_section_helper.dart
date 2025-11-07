class UploadSectionHelper {
  // Responsive helper methods
  static double getCardPadding(double screenWidth) {
    if (screenWidth < 360) return 12;
    if (screenWidth < 600) return 14;
    return 16;
  }

  static double getTitleFontSize(double screenWidth) {
    if (screenWidth < 360) return 12;
    if (screenWidth < 600) return 13;
    return 14;
  }

  static double getSubtitleFontSize(double screenWidth) {
    if (screenWidth < 360) return 14;
    if (screenWidth < 600) return 15;
    return 16;
  }

  static double getSuccessFontSize(double screenWidth) {
    if (screenWidth < 360) return 10;
    if (screenWidth < 600) return 11;
    return 12;
  }

  static double getImageWidth(double screenWidth) {
    if (screenWidth < 360) return 80;
    if (screenWidth < 600) return 88;
    return 96;
  }

  static double getImageHeight(double screenWidth) {
    if (screenWidth < 360) return 54;
    if (screenWidth < 600) return 58;
    return 64;
  }

  static double getButtonFontSize(double screenWidth) {
    if (screenWidth < 360) return 12;
    if (screenWidth < 600) return 13;
    return 14;
  }

  static double getIconSize(double screenWidth) {
    if (screenWidth < 360) return 18;
    if (screenWidth < 600) return 19;
    return 20;
  }

  static double getCheckIconSize(double screenWidth) {
    if (screenWidth < 360) return 20;
    if (screenWidth < 600) return 22;
    return 24;
  }

  static double getSpacing(double screenWidth) {
    if (screenWidth < 360) return 12;
    if (screenWidth < 600) return 14;
    return 16;
  }

  static double getBorderRadius(double screenWidth) {
    if (screenWidth < 360) return 8;
    if (screenWidth < 600) return 10;
    return 12;
  }
}
