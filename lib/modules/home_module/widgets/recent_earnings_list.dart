import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:throw_delivery/core/enums/payment_status.dart';
import 'package:throw_delivery/core/models/delivery_request_model.dart';
import 'package:throw_delivery/modules/home_module/widgets/earnings_list_item.dart';

class RecentEarningsList extends StatelessWidget {
  final Color cardColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color accentColor;
  final Color successColor;
  final Color dangerColor;
  final List<DeliveryRequestModel> deliveryRequests;

  const RecentEarningsList({
    super.key,
    required this.cardColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.accentColor,
    required this.successColor,
    required this.dangerColor,
    required this.deliveryRequests,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 6,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Recent Earnings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: textPrimaryColor,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Earnings List
          Expanded(
            child: ListView.builder(
              itemCount: deliveryRequests.length,
              itemBuilder: (context, index) {
                final req = deliveryRequests[index];
                final amountValue =
                    (req.agreedDeliveryCharge ?? req.baseDeliveryCharge);
                final isPositive =
                    req.paymentStatus == PaymentStatus.escrowAmountReleased;
                final icon = isPositive
                    ? Icons.arrow_downward
                    : Icons.call_made;
                final iconClr = isPositive ? successColor : dangerColor;
                final bgClr = (isPositive ? successColor : dangerColor)
                    .withValues(alpha: 0.1);
                final amountText =
                    '${isPositive ? '\u2197 ₹' : '\u2198 ₹'}${amountValue.abs().toStringAsFixed(2)}';
                final DateFormat formatter = DateFormat('dd MMM, yyyy');
                final subtitle = formatter.format(req.updatedAt.toDate());

                return EarningsListItem(
                  icon: icon,
                  iconColor: iconClr,
                  backgroundColor: bgClr,
                  title: 'Delivery #${req.deliveryRequestId}',
                  subtitle: subtitle,
                  amount: amountText,
                  amountColor: iconClr,
                  textPrimaryColor: textPrimaryColor,
                  textSecondaryColor: textSecondaryColor,
                  accentColor: accentColor,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
