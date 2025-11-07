import 'package:flutter/material.dart';

class EscrowReleasedCard extends StatelessWidget {
  final Color cardColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color accentColor;
  final Color successColor;
  final Color primaryColor;

  const EscrowReleasedCard({
    super.key,
    required this.cardColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.accentColor,
    required this.successColor,
    required this.primaryColor,
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
          _AmountRow(
            icon: Icons.security,
            iconColor: primaryColor,
            title: 'In Escrow',
            amount: '₹550.00',
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
          _AmountRow(
            icon: Icons.verified,
            iconColor: successColor,
            title: 'Released',
            amount: '₹1,900.75',
            amountColor: successColor,
            textPrimaryColor: textPrimaryColor,
            textSecondaryColor: textSecondaryColor,
          ),
        ],
      ),
    );
  }
}

class _AmountRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String amount;
  final Color amountColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;

  const _AmountRow({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.amount,
    required this.amountColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14, color: textSecondaryColor),
            ),
            const SizedBox(height: 4),
            Text(
              amount,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: amountColor,
              ),
            ),
          ],
        ),
        Icon(icon, color: iconColor, size: 32),
      ],
    );
  }
}
