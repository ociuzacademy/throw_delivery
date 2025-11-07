import 'package:flutter/material.dart';

class RecentEarningsList extends StatelessWidget {
  final Color cardColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color accentColor;
  final Color successColor;
  final Color dangerColor;

  const RecentEarningsList({
    super.key,
    required this.cardColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.accentColor,
    required this.successColor,
    required this.dangerColor,
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
            child: ListView(
              children: [
                _EarningsListItem(
                  icon: Icons.arrow_downward,
                  iconColor: successColor,
                  backgroundColor: successColor.withValues(alpha: 0.1),
                  title: 'Delivery #A123',
                  subtitle: 'Today, 02:30 PM',
                  amount: '+ ₹80.00',
                  amountColor: successColor,
                  textPrimaryColor: textPrimaryColor,
                  textSecondaryColor: textSecondaryColor,
                  accentColor: accentColor,
                ),
                _EarningsListItem(
                  icon: Icons.arrow_downward,
                  iconColor: successColor,
                  backgroundColor: successColor.withValues(alpha: 0.1),
                  title: 'Delivery #B456',
                  subtitle: 'Today, 11:15 AM',
                  amount: '+ ₹40.50',
                  amountColor: successColor,
                  textPrimaryColor: textPrimaryColor,
                  textSecondaryColor: textSecondaryColor,
                  accentColor: accentColor,
                ),
                _EarningsListItem(
                  icon: Icons.call_made,
                  iconColor: dangerColor,
                  backgroundColor: dangerColor.withValues(alpha: 0.1),
                  title: 'Withdrawal',
                  subtitle: 'Yesterday, 06:00 PM',
                  amount: '- ₹500.00',
                  amountColor: dangerColor,
                  textPrimaryColor: textPrimaryColor,
                  textSecondaryColor: textSecondaryColor,
                  accentColor: accentColor,
                ),
                _EarningsListItem(
                  icon: Icons.arrow_downward,
                  iconColor: successColor,
                  backgroundColor: successColor.withValues(alpha: 0.1),
                  title: 'Delivery #C789',
                  subtitle: 'Yesterday, 09:45 AM',
                  amount: '+ ₹150.00',
                  amountColor: successColor,
                  textPrimaryColor: textPrimaryColor,
                  textSecondaryColor: textSecondaryColor,
                  accentColor: accentColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EarningsListItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color backgroundColor;
  final String title;
  final String subtitle;
  final String amount;
  final Color amountColor;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color accentColor;

  const _EarningsListItem({
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.title,
    required this.subtitle,
    required this.amount,
    required this.amountColor,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () {
              // Handle item tap
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  // Icon Container
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: iconColor, size: 20),
                  ),
                  const SizedBox(width: 12),

                  // Text Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: textPrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: textSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Amount
                  Text(
                    amount,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: amountColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
