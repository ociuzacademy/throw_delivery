import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';
import 'package:throw_delivery/core/widgets/loaders/overlay_loader.dart';
import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_delivery/modules/bidding_status_module/view/bidding_status_page.dart';

import 'package:throw_delivery/modules/place_bid_module/helper/place_bid_color_scheme.dart';
import 'package:throw_delivery/modules/place_bid_module/helper/place_bid_responsive_sizes.dart';
import 'package:throw_delivery/modules/place_bid_module/utils/place_bid_helper.dart';
import 'package:throw_delivery/modules/place_bid_module/widgets/auction_info_card.dart';
import 'package:throw_delivery/modules/place_bid_module/widgets/bid_input_card.dart';
import 'package:throw_delivery/modules/place_bid_module/widgets/submit_bid_button.dart';

class PlaceBidPage extends StatefulWidget {
  final String deliveryRequestId;
  final double baseBidAmount;
  final double currentMinBid;
  final DateTime auctionStartTime;

  const PlaceBidPage({
    super.key,
    required this.deliveryRequestId,
    required this.baseBidAmount,
    required this.currentMinBid,
    required this.auctionStartTime,
  });

  @override
  State<PlaceBidPage> createState() => _PlaceBidPageState();

  static MaterialPageRoute route({
    required String deliveryRequestId,
    required double baseBidAmount,
    required double currentMinBid,
    required DateTime auctionStartTime,
  }) => MaterialPageRoute(
    builder: (_) => PlaceBidPage(
      deliveryRequestId: deliveryRequestId,
      baseBidAmount: baseBidAmount,
      currentMinBid: currentMinBid,
      auctionStartTime: auctionStartTime,
    ),
  );
}

class _PlaceBidPageState extends State<PlaceBidPage> {
  late final PlaceBidHelper _placeBidHelper;
  final TextEditingController _bidAmountController = TextEditingController();

  // Refactored state into ValueNotifiers
  late final ValueNotifier<int> _totalSeconds = ValueNotifier<int>(
    PlaceBidHelper.calculateRemainingSeconds(widget.auctionStartTime),
  );
  late final ValueNotifier<bool> _isExpired = ValueNotifier<bool>(
    _totalSeconds.value <= 0,
  );

  @override
  void initState() {
    super.initState();
    _placeBidHelper = PlaceBidHelper(
      requestId: widget.deliveryRequestId,
      context: context,
      auctionStartTime: widget.auctionStartTime,
      bidAmountController: _bidAmountController,
      totalSeconds: _totalSeconds,
      isExpired: _isExpired,
      baseBidAmount: widget.baseBidAmount,
      currentMinBidAmount: widget.currentMinBid,
    );
    _placeBidHelper.startTimer();
  }

  @override
  void dispose() {
    _placeBidHelper.cancelTimer();
    _totalSeconds.dispose();
    _isExpired.dispose();
    _bidAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Helper classes
    final colorScheme = PlaceBidColorScheme(isDark);
    final responsiveSizes = PlaceBidResponsiveSizes(screenWidth, screenHeight);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Place Your Bid',
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
      body: BlocListener<PlaceBidBloc, PlaceBidState>(
        listener: (context, state) {
          switch (state) {
            case PlaceBidLoading():
              OverlayLoader.show(context, message: 'Placing bid...');
              break;
            case PlaceBidSuccess(:final bidId):
              OverlayLoader.hide();
              // _placeBidHelper.cancelTimer();
              CustomSnackbar.showSuccess(
                context: context,
                message: 'Bid placed successfully with id $bidId!',
              );
              final double bidAmount = double.parse(
                _bidAmountController.text.trim(),
              );
              Navigator.pushReplacement(
                context,
                BiddingStatusPage.route(
                  bidId: bidId,
                  auctionStartTime: widget.auctionStartTime,
                  bidAmount: bidAmount,
                  baseBidAmount: widget.baseBidAmount,
                  currentMinBid: widget.currentMinBid,
                ),
              );
              break;
            case PlaceBidError(:final message):
              OverlayLoader.hide();
              CustomSnackbar.showError(context: context, message: message);
              break;
            default:
              OverlayLoader.hide();
              break;
          }
        },
        child: Container(
          color: colorScheme.backgroundColor,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(responsiveSizes.horizontalPadding),
                  child: Column(
                    children: [
                      SizedBox(height: screenHeight * 0.04),

                      // Auction Info Card
                      AuctionInfoCard(
                        colorScheme: colorScheme,
                        responsiveSizes: responsiveSizes,
                        basePrice: widget.baseBidAmount,
                        currentMinBid: widget.currentMinBid,
                        totalSeconds: _totalSeconds,
                        isExpired: _isExpired,
                      ),
                      SizedBox(height: screenHeight * 0.04),

                      // Bid Input Card
                      BidInputCard(
                        colorScheme: colorScheme,
                        responsiveSizes: responsiveSizes,
                        bidAmountController: _bidAmountController,
                        isExpired: _isExpired,
                        isDark: isDark,
                        placeBidHelper: _placeBidHelper,
                      ),
                      SizedBox(height: screenHeight * 0.04),

                      // Submit Bid Button
                      SubmitBidButton(
                        colorScheme: colorScheme,
                        responsiveSizes: responsiveSizes,
                        isExpired: _isExpired,
                        onPressed: _placeBidHelper.submitBid,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
