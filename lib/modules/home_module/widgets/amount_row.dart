import 'package:flutter/material.dart';

class AmountRow extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String amount;
  final Color amountColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;

  const AmountRow({
    super.key,
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
