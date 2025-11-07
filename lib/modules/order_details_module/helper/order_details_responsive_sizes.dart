class OrderDetailsResponsiveSizes {
  final double screenWidth;
  final double screenHeight;

  OrderDetailsResponsiveSizes(this.screenWidth, this.screenHeight);

  double get horizontalPadding => screenWidth < 360 ? 16.0 : 20.0;
  double get cardPadding => screenWidth < 360 ? 16.0 : 20.0;
  double get titleFontSize => screenWidth < 360 ? 18.0 : 20.0;
  double get bodyFontSize => screenWidth < 360 ? 14.0 : 16.0;
  double get smallFontSize => screenWidth < 360 ? 12.0 : 14.0;
  double get largeFontSize => screenWidth < 360 ? 20.0 : 24.0;
  double get iconSize => screenWidth < 360 ? 18.0 : 20.0;
  double get smallSpacing => screenHeight * 0.01;
  double get mediumSpacing => screenHeight * 0.02;
  double get largeSpacing => screenHeight * 0.03;
  double get buttonVerticalPadding => screenHeight * 0.016;
  double get avatarSize => screenWidth < 360 ? 48.0 : 56.0;
  double get timelineIconSize => screenWidth < 360 ? 20.0 : 24.0;
}
