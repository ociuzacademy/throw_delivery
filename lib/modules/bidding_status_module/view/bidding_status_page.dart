import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/bidding_status_module/helpers/bidding_status_color_scheme.dart';
import 'package:throw_delivery/modules/bidding_status_module/helpers/bidding_status_responsive_sizes.dart';

import 'package:throw_delivery/modules/bidding_status_module/utils/bidding_status_helper.dart';
import 'package:throw_delivery/modules/bidding_status_module/widgets/bargain_card.dart';
import 'package:throw_delivery/modules/bidding_status_module/widgets/bid_info_card.dart';
import 'package:throw_delivery/modules/bidding_status_module/widgets/countdown_card.dart';

class BiddingStatusPage extends StatefulWidget {
  final double bidAmount;
  final double baseBidAmount;
  final double currentMinBid;

  const BiddingStatusPage({
    super.key,
    required this.bidAmount,
    this.baseBidAmount = 20.00,
    this.currentMinBid = 18.00,
  });

  @override
  State<BiddingStatusPage> createState() => _BiddingStatusPageState();

  static MaterialPageRoute route({
    required double bidAmount,
    double? baseBidAmount,
    double? currentMinBid,
  }) => MaterialPageRoute(
    builder: (_) => BiddingStatusPage(
      bidAmount: bidAmount,
      baseBidAmount: baseBidAmount ?? 200,
      currentMinBid: currentMinBid ?? 190,
    ),
  );
}

class _BiddingStatusPageState extends State<BiddingStatusPage> {
  late final BiddingStatusHelper _biddingStatusHelper;
  final ValueNotifier<int> _totalSecondsNotifier = ValueNotifier<int>(
    150,
  ); // 2 minutes 30 seconds
  final ValueNotifier<bool> _isExpiredNotifier = ValueNotifier<bool>(false);
  final ValueNotifier<double> _currentBidNotifier = ValueNotifier<double>(0.00);
  final ValueNotifier<double> _currentMinBidNotifier = ValueNotifier<double>(
    0.00,
  );
  final ValueNotifier<double> _bargainAmountNotifier = ValueNotifier<double>(
    0.0,
  );
  final ValueNotifier<bool> _showBargainSectionNotifier = ValueNotifier<bool>(
    false,
  );
  final ValueNotifier<bool> _hasValidBargainNotifier = ValueNotifier<bool>(
    false,
  );

  @override
  void initState() {
    super.initState();
    _currentBidNotifier.value = widget.bidAmount;
    _currentMinBidNotifier.value = widget.currentMinBid;
    _biddingStatusHelper = BiddingStatusHelper(
      context: context,
      totalSecondsNotifier: _totalSecondsNotifier,
      isExpiredNotifier: _isExpiredNotifier,
      currentBidNotifier: _currentBidNotifier,
      currentMinBidNotifier: _currentMinBidNotifier,
      bargainAmountNotifier: _bargainAmountNotifier,
      showBargainSectionNotifier: _showBargainSectionNotifier,
      hasValidBargainNotifier: _hasValidBargainNotifier,
      baseBidAmount: widget.baseBidAmount,
      currentMinimumBid: widget.currentMinBid,
    );
    _biddingStatusHelper.startTimer();
    _biddingStatusHelper.startBargainSimulation();
  }

  @override
  void dispose() {
    _biddingStatusHelper.cancelTimer();
    _biddingStatusHelper.cancelBargainSimulation();
    _totalSecondsNotifier.dispose();
    _isExpiredNotifier.dispose();
    _currentBidNotifier.dispose();
    _currentMinBidNotifier.dispose();
    _bargainAmountNotifier.dispose();
    _showBargainSectionNotifier.dispose();
    _hasValidBargainNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Helper classes
    final colorScheme = BiddingStatusColorScheme(isDark);
    final responsiveSizes = BiddingStatusResponsiveSizes(
      screenWidth,
      screenHeight,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bidding Status',
          style: GoogleFonts.inter(
            fontSize: responsiveSizes.titleFontSize,
            fontWeight: FontWeight.w700,
            color: colorScheme.textColor,
          ),
        ),
        backgroundColor: colorScheme.secondaryColor,
        foregroundColor: colorScheme.iconColor,
        elevation: 4,
        shadowColor: colorScheme.shadowColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Container(
          color: colorScheme.backgroundColor,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(responsiveSizes.horizontalPadding),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.04),

                // Bid Information Card
                ValueListenableBuilder(
                  valueListenable: _currentMinBidNotifier,
                  builder: (context, currentMinBid, child) {
                    return BidInfoCard(
                      colorScheme: colorScheme,
                      responsiveSizes: responsiveSizes,
                      baseBidAmount: widget.baseBidAmount,
                      currentMinBid: currentMinBid,
                      currentBidNotifier: _currentBidNotifier,
                    );
                  },
                ),
                SizedBox(height: screenHeight * 0.04),

                // Bargain Card - Only show if bargain section is visible and has valid bargain
                ValueListenableBuilder<bool>(
                  valueListenable: _showBargainSectionNotifier,
                  builder: (context, showBargain, child) {
                    if (!showBargain || !_hasValidBargainNotifier.value) {
                      return const SizedBox.shrink();
                    }

                    return ValueListenableBuilder<double>(
                      valueListenable: _bargainAmountNotifier,
                      builder: (context, bargainAmount, child) {
                        return BargainCard(
                          colorScheme: colorScheme,
                          responsiveSizes: responsiveSizes,
                          bargainAmount: bargainAmount,
                          isExpiredNotifier: _isExpiredNotifier,
                          onAccept: _biddingStatusHelper.handleAcceptBargain,
                          onReject: _biddingStatusHelper.handleRejectBargain,
                        );
                      },
                    );
                  },
                ),
                SizedBox(height: screenHeight * 0.04),

                // Countdown Timer Card
                CountdownCard(
                  colorScheme: colorScheme,
                  responsiveSizes: responsiveSizes,
                  totalSecondsNotifier: _totalSecondsNotifier,
                  isExpiredNotifier: _isExpiredNotifier,
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
