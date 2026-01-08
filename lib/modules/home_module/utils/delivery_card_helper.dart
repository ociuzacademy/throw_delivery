import 'package:flutter/material.dart';
import 'package:throw_delivery/core/exports/enum_exports.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_color_scheme.dart';
import 'package:throw_delivery/modules/home_module/models/status_config.dart';

class DeliveryCardHelper {
  static Color getAmountColor(
    DeliveryStatus status,
    CompletedDeliveriesColorScheme colorScheme,
  ) {
    switch (status) {
      case DeliveryStatus.dropOff:
        return colorScheme.primaryColor;
      case DeliveryStatus.pending:
        return colorScheme.dangerColor;
      case DeliveryStatus.onTheWay:
        return colorScheme.infoColor;
    }
  }

  static StatusConfig getStatusConfig(
    DeliveryStatus status,
    CompletedDeliveriesColorScheme colorScheme,
  ) {
    switch (status) {
      case DeliveryStatus.onTheWay:
        return StatusConfig('On The Way', colorScheme.infoColor);
      case DeliveryStatus.pending:
        return StatusConfig('Pending', colorScheme.warningColor);
      case DeliveryStatus.dropOff:
        return StatusConfig('Drop Off', colorScheme.successColor);
    }
  }
}
