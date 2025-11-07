class CompletedDeliveriesResponsiveSizes {
  final double screenWidth;

  CompletedDeliveriesResponsiveSizes(this.screenWidth);

  double get horizontalPadding => screenWidth < 360 ? 16.0 : 16.0;
  double get cardPadding => screenWidth < 360 ? 16.0 : 16.0;
  double get titleFontSize => screenWidth < 360 ? 18.0 : 20.0;
  double get bodyFontSize => screenWidth < 360 ? 14.0 : 16.0;
  double get smallFontSize => screenWidth < 360 ? 12.0 : 14.0;
  double get amountFontSize => screenWidth < 360 ? 16.0 : 18.0;
  double get verticalSpacing => screenWidth < 360 ? 12.0 : 16.0;
  double get iconSize => screenWidth < 360 ? 18.0 : 20.0;
}
