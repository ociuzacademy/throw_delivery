import 'package:flutter/material.dart';
import 'package:throw_delivery/modules/home_module/widgets/earnings_stat_card.dart';

class EarningsStatsGrid extends StatelessWidget {
  final Color cardColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final double todayEarnings;
  final double totalEarnings;

  const EarningsStatsGrid({
    super.key,
    required this.cardColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.todayEarnings, // = 120.50,
    required this.totalEarnings, // = 2450.75,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EarningsStatCard(
            cardColor: cardColor,
            textPrimaryColor: textPrimaryColor,
            textSecondaryColor: textSecondaryColor,
            title: "Today's Earnings",
            amount: '₹${todayEarnings.toStringAsFixed(2)}',
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: EarningsStatCard(
            cardColor: cardColor,
            textPrimaryColor: textPrimaryColor,
            textSecondaryColor: textSecondaryColor,
            title: 'Total Earnings',
            amount: '₹${totalEarnings.toStringAsFixed(2)}',
          ),
        ),
      ],
    );
  }
}
