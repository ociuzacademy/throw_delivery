import 'package:flutter/material.dart';
import 'package:throw_delivery/modules/home_module/widgets/amount_row.dart';

class EscrowReleasedCard extends StatelessWidget {
  final Color cardColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color accentColor;
  final Color successColor;
  final Color primaryColor;
  final double amountInEscrow;
  final double amountReleased;

  const EscrowReleasedCard({
    super.key,
    required this.cardColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.accentColor,
    required this.successColor,
    required this.primaryColor,
    required this.amountInEscrow, // = 550.00,
    required this.amountReleased, // = 1900.75,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
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
        children: [
          // In Escrow Row
          AmountRow(
            icon: Icons.security,
            iconColor: primaryColor,
            title: 'In Escrow',
            amount: '₹${amountInEscrow.toStringAsFixed(2)}',
            amountColor: textPrimaryColor,
            textPrimaryColor: textPrimaryColor,
            textSecondaryColor: textSecondaryColor,
          ),

          // Divider
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: 16),
            color: accentColor,
          ),

          // Released Row
          AmountRow(
            icon: Icons.verified,
            iconColor: successColor,
            title: 'Released',
            amount: '₹${amountReleased.toStringAsFixed(2)}',
            amountColor: successColor,
            textPrimaryColor: textPrimaryColor,
            textSecondaryColor: textSecondaryColor,
          ),
        ],
      ),
    );
  }
}
