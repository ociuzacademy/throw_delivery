import 'package:flutter/material.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_color_scheme.dart';
import 'package:throw_delivery/modules/delivery_request_details_module/helper/delivery_request_details_responsive_sizes.dart';

class DetailCard extends StatelessWidget {
  final DeliveryRequestDetailsColorScheme colorScheme;
  final DeliveryRequestDetailsResponsiveSizes responsiveSizes;
  final Widget child;

  const DetailCard({
    super.key,
    required this.colorScheme,
    required this.responsiveSizes,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(responsiveSizes.cardPadding),
      decoration: BoxDecoration(
        color: colorScheme.secondaryColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadowColor,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
