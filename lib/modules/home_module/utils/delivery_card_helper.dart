import 'package:flutter/material.dart';
import 'package:throw_delivery/modules/home_module/enums/delivery_status.dart';
import 'package:throw_delivery/modules/home_module/helpers/completed_deliveries_color_scheme.dart';
import 'package:throw_delivery/modules/home_module/models/status_config.dart';

class DeliveryCardHelper {
  static Color getAmountColor(
    DeliveryStatus status,
    CompletedDeliveriesColorScheme colorScheme,
  ) {
    switch (status) {
      case DeliveryStatus.completed:
        return colorScheme.primaryColor;
      case DeliveryStatus.canceled:
        return colorScheme.dangerColor;
      case DeliveryStatus.pickup:
        return colorScheme.infoColor;
      case DeliveryStatus.ongoing:
        return colorScheme.warningColor;
    }
  }

  static StatusConfig getStatusConfig(
    DeliveryStatus status,
    CompletedDeliveriesColorScheme colorScheme,
  ) {
    switch (status) {
      case DeliveryStatus.pickup:
        return StatusConfig('Pickup', colorScheme.infoColor);
      case DeliveryStatus.ongoing:
        return StatusConfig('Ongoing', colorScheme.warningColor);
      case DeliveryStatus.completed:
        return StatusConfig('Completed', colorScheme.successColor);
      case DeliveryStatus.canceled:
        return StatusConfig('Canceled', colorScheme.dangerColor);
    }
  }
}
