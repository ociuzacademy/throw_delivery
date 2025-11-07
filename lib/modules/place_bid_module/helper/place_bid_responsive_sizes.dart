class PlaceBidResponsiveSizes {
  final double screenWidth;
  final double screenHeight;

  PlaceBidResponsiveSizes(this.screenWidth, this.screenHeight);

  double get horizontalPadding => screenWidth < 360 ? 16.0 : 24.0;
  double get cardPadding => screenWidth < 360 ? 16.0 : 24.0;
  double get largeCardPadding => screenWidth < 360 ? 20.0 : 32.0;
  double get titleFontSize => screenWidth < 360 ? 18.0 : 20.0;
  double get bodyFontSize => screenWidth < 360 ? 14.0 : 16.0;
  double get smallFontSize => screenWidth < 360 ? 12.0 : 14.0;
  double get countdownFontSize => screenWidth < 360 ? 32.0 : 36.0;
  double get bidInputFontSize => screenWidth < 360 ? 20.0 : 24.0;
  double get priceFontSize => screenWidth < 360 ? 20.0 : 24.0;
}
