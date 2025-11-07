import 'package:flutter/material.dart';

class EarningsStatsGrid extends StatelessWidget {
  final Color cardColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;

  const EarningsStatsGrid({
    super.key,
    required this.cardColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _EarningsStatCard(
            cardColor: cardColor,
            textPrimaryColor: textPrimaryColor,
            textSecondaryColor: textSecondaryColor,
            title: "Today's Earnings",
            amount: '₹120.50',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _EarningsStatCard(
            cardColor: cardColor,
            textPrimaryColor: textPrimaryColor,
            textSecondaryColor: textSecondaryColor,
            title: 'Total Earnings',
            amount: '₹2,450.75',
          ),
        ),
      ],
    );
  }
}

class _EarningsStatCard extends StatelessWidget {
  final Color cardColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final String title;
  final String amount;

  const _EarningsStatCard({
    required this.cardColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.title,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              fontWeight: FontWeight.bold,
              color: textPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
