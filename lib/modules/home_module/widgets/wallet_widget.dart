import 'package:flutter/material.dart';
import 'package:throw_delivery/modules/home_module/widgets/earnings_stats_grid.dart';
import 'package:throw_delivery/modules/home_module/widgets/escrow_released_card.dart';
import 'package:throw_delivery/modules/home_module/widgets/recent_earnings_list.dart';
import 'package:throw_delivery/modules/home_module/widgets/withdraw_button.dart';

class WalletWidget extends StatelessWidget {
  const WalletWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final isSmallScreen = mediaQuery.size.width < 600;
    final isVerySmallScreen = mediaQuery.size.width < 400;

    // Color definitions
    final primaryColor = const Color(0xFF00BFFF);
    final _ = isDark ? const Color(0xFF121212) : const Color(0xFFF3F4F6);
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textPrimaryColor = isDark ? Colors.white : const Color(0xFF1F2937);
    final textSecondaryColor = isDark
        ? const Color(0xFF9E9E9E)
        : const Color(0xFF6B7280);
    final successColor = const Color(0xFF10B981);
    final dangerColor = const Color(0xFFEF4444);
    final accentColor = isDark
        ? const Color(0xFF2A2A2A)
        : const Color(0xFFF3F4F6);

    // Responsive dimensions
    final _ = isSmallScreen ? 70.0 : 80.0;
    final horizontalPadding = isSmallScreen ? 16.0 : 24.0;
    final _ = isSmallScreen ? 20.0 : 24.0;
    final _ = isSmallScreen ? 24.0 : 28.0;

    // Responsive spacing
    final _ = isVerySmallScreen ? 8.0 : 12.0;
    final _ = isVerySmallScreen ? 12.0 : 16.0;
    final mediumSpacing = isVerySmallScreen ? 16.0 : 20.0;
    final _ = isVerySmallScreen ? 20.0 : 24.0;
    final _ = isVerySmallScreen ? 24.0 : 32.0;

    return Column(
      children: [
        // Main Content
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(horizontalPadding),
            child: Column(
              children: [
                SizedBox(height: mediumSpacing),

                // Withdraw Button
                WithdrawButton(
                  primaryColor: primaryColor,
                  textPrimaryColor: Colors.white,
                ),
                SizedBox(height: mediumSpacing),

                // Earnings Stats Grid
                EarningsStatsGrid(
                  cardColor: cardColor,
                  textPrimaryColor: textPrimaryColor,
                  textSecondaryColor: textSecondaryColor,
                ),
                SizedBox(height: mediumSpacing),

                // Escrow and Released Card
                EscrowReleasedCard(
                  cardColor: cardColor,
                  textPrimaryColor: textPrimaryColor,
                  textSecondaryColor: textSecondaryColor,
                  accentColor: accentColor,
                  successColor: successColor,
                  primaryColor: primaryColor,
                ),
                SizedBox(height: mediumSpacing),

                // Recent Earnings List
                Expanded(
                  child: RecentEarningsList(
                    cardColor: cardColor,
                    textPrimaryColor: textPrimaryColor,
                    textSecondaryColor: textSecondaryColor,
                    accentColor: accentColor,
                    successColor: successColor,
                    dangerColor: dangerColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
