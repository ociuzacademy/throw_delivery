class DeliveryRequestDetailsResponsiveSizes {
  final double screenWidth;
  final double screenHeight;

  DeliveryRequestDetailsResponsiveSizes(this.screenWidth, this.screenHeight);

  double get horizontalPadding => screenWidth < 360 ? 16.0 : 24.0;
  double get cardPadding => screenWidth < 360 ? 16.0 : 24.0;
  double get avatarSize => screenWidth < 360 ? 56.0 : 64.0;
  double get iconSize => screenWidth < 360 ? 20.0 : 24.0;
  double get largeIconSize => screenWidth < 360 ? 28.0 : 32.0;
  double get titleFontSize => screenWidth < 360 ? 18.0 : 20.0;
  double get bodyFontSize => screenWidth < 360 ? 14.0 : 16.0;
  double get smallFontSize => screenWidth < 360 ? 12.0 : 14.0;
  double get smallSpacing => screenHeight * 0.015;
  double get mediumSpacing => screenHeight * 0.02;
  double get tinySpacing => screenHeight * 0.004;
  double get microSpacing => screenHeight * 0.008;
  double get buttonVerticalPadding => screenHeight * 0.018;
  double get horizontalGap => screenWidth < 360 ? 12.0 : 16.0;
  double get tinyHorizontalGap => screenWidth < 360 ? 2.0 : 4.0;
}
