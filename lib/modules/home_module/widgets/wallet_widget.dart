import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';
import 'package:throw_delivery/core/widgets/custom_empty_widget.dart';
import 'package:throw_delivery/core/widgets/custom_error_widget.dart';
import 'package:throw_delivery/core/widgets/loaders/custom_loader_widget.dart';
import 'package:throw_delivery/modules/home_module/utils/wallet_widget_helper.dart';
import 'package:throw_delivery/modules/home_module/widgets/earnings_stats_grid.dart';
import 'package:throw_delivery/modules/home_module/widgets/escrow_released_card.dart';
import 'package:throw_delivery/modules/home_module/widgets/recent_earnings_list.dart';

class WalletWidget extends StatefulWidget {
  const WalletWidget({super.key});

  @override
  State<WalletWidget> createState() => _WalletWidgetState();
}

class _WalletWidgetState extends State<WalletWidget> {
  late final WalletWidgetHelper _helper;

  @override
  void initState() {
    super.initState();
    _helper = WalletWidgetHelper(context: context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _helper.getAgentDeliveryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final mediaQuery = MediaQuery.of(context);
    final isSmallScreen = mediaQuery.size.width < 600;
    final isVerySmallScreen = mediaQuery.size.width < 400;

    // Color definitions
    const primaryColor = Color(0xFF00BFFF);
    final _ = isDark ? const Color(0xFF121212) : const Color(0xFFF3F4F6);
    final cardColor = isDark ? const Color(0xFF1E1E1E) : Colors.white;
    final textPrimaryColor = isDark ? Colors.white : const Color(0xFF1F2937);
    final textSecondaryColor = isDark
        ? const Color(0xFF9E9E9E)
        : const Color(0xFF6B7280);
    const successColor = Color(0xFF10B981);
    const dangerColor = Color(0xFFEF4444);
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

    return BlocBuilder<AgentDeliveryListCubit, AgentDeliveryListState>(
      builder: (context, state) {
        return switch (state) {
          AgentDeliveryListLoading() => const CustomLoaderWidget(
            message: 'Loading wallet data...',
          ),
          AgentDeliveryListEmpty() => CustomEmptyWidget(
            message: 'Wallet data unavailable.',
            isDark: isDark,
          ),
          AgentDeliveryListError(:final message) => CustomErrorWidget(
            errorMessage: message,
            isDark: isDark,
            onRetry: _helper.getAgentDeliveryList,
          ),
          AgentDeliveryListLoaded(:final deliveryRequests) => Column(
            children: [
              // Main Content
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(horizontalPadding),
                  child: Column(
                    children: [
                      SizedBox(height: mediumSpacing),

                      // Earnings Stats Grid
                      Builder(
                        builder: (context) {
                          final double todayEarnings = _helper
                              .calculateTodayEarnings(deliveryRequests);
                          final double totalEarnings = _helper
                              .calculateTotalEarnings(deliveryRequests);
                          return EarningsStatsGrid(
                            cardColor: cardColor,
                            textPrimaryColor: textPrimaryColor,
                            textSecondaryColor: textSecondaryColor,
                            todayEarnings: todayEarnings,
                            totalEarnings: totalEarnings,
                          );
                        },
                      ),
                      SizedBox(height: mediumSpacing),

                      // Escrow and Released Card
                      Builder(
                        builder: (context) {
                          final double amountInEscrow = _helper
                              .calculateAmountInEscrow(deliveryRequests);
                          final double amountReleased = _helper
                              .calculateAmountReleased(deliveryRequests);
                          return EscrowReleasedCard(
                            cardColor: cardColor,
                            textPrimaryColor: textPrimaryColor,
                            textSecondaryColor: textSecondaryColor,
                            accentColor: accentColor,
                            successColor: successColor,
                            primaryColor: primaryColor,
                            amountInEscrow: amountInEscrow,
                            amountReleased: amountReleased,
                          );
                        },
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
                          deliveryRequests: deliveryRequests,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}
