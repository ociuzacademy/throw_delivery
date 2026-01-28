class OrderDetailsResponsiveSizes {
  final double screenWidth;
  final double screenHeight;

  OrderDetailsResponsiveSizes(this.screenWidth, this.screenHeight);

  double get horizontalPadding => screenWidth < 360 ? 16.0 : 20.0;
  double get cardPadding => screenWidth < 360 ? 16.0 : 20.0;
  double get titleFontSize => screenWidth < 360 ? 16.0 : 18.0;
  double get bodyFontSize => screenWidth < 360 ? 13.0 : 14.0;
  double get smallFontSize => screenWidth < 360 ? 11.0 : 12.0;
  double get largeFontSize => screenWidth < 360 ? 18.0 : 20.0;
  double get iconSize => screenWidth < 360 ? 18.0 : 20.0;
  double get smallSpacing => 8.0;
  double get mediumSpacing => 16.0;
  double get largeSpacing => 24.0;
  double get buttonVerticalPadding => 14.0;
  double get avatarSize => 56.0;
  double get timelineIconSize => 24.0;
}
