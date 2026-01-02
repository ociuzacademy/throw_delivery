import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/enums/bid_status.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';
import 'package:throw_delivery/core/repository/delivery_request_repository.dart';
import 'package:throw_delivery/core/widgets/custom_error_widget.dart';
import 'package:throw_delivery/core/widgets/loaders/overlay_loader.dart';
import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_delivery/modules/bid_result_module/view/bid_result_page.dart';
import 'package:throw_delivery/modules/bidding_status_module/cubit/bid_status_cubit.dart';
import 'package:throw_delivery/modules/bidding_status_module/helpers/bidding_status_color_scheme.dart';
import 'package:throw_delivery/modules/bidding_status_module/helpers/bidding_status_responsive_sizes.dart';

import 'package:throw_delivery/modules/bidding_status_module/utils/bidding_status_helper.dart';
import 'package:throw_delivery/modules/bidding_status_module/widgets/bargain_card.dart';
import 'package:throw_delivery/modules/bidding_status_module/widgets/bid_info_card.dart';
import 'package:throw_delivery/modules/bidding_status_module/widgets/countdown_card.dart';

class BiddingStatusPage extends StatefulWidget {
  final String requestId;
  final String bidId;
  final DateTime auctionStartTime;
  final double bidAmount;
  final double baseBidAmount;
  final double currentMinBid;

  const BiddingStatusPage({
    super.key,
    required this.requestId,
    required this.bidId,
    required this.auctionStartTime,
    required this.bidAmount,
    required this.baseBidAmount,
    required this.currentMinBid,
  });

  @override
  State<BiddingStatusPage> createState() => _BiddingStatusPageState();

  static MaterialPageRoute route({
    required String requestId,
    required String bidId,
    required DateTime auctionStartTime,
    required double bidAmount,
    required double baseBidAmount,
    required double currentMinBid,
  }) => MaterialPageRoute(
    builder: (_) => BlocProvider(
      create: (context) =>
          BidStatusCubit(repository: context.read<DeliveryRequestRepository>())
            ..getBidStatus(requestId: requestId, bidId: bidId),
      child: BiddingStatusPage(
        requestId: requestId,
        bidId: bidId,
        auctionStartTime: auctionStartTime,
        bidAmount: bidAmount,
        baseBidAmount: baseBidAmount,
        currentMinBid: currentMinBid,
      ),
    ),
  );
}

class _BiddingStatusPageState extends State<BiddingStatusPage> {
  late final BiddingStatusHelper _biddingStatusHelper;
  late final ValueNotifier<int> _totalSecondsNotifier = ValueNotifier<int>(
    BiddingStatusHelper.calculateRemainingSeconds(widget.auctionStartTime),
  );
  late final ValueNotifier<bool> _isExpiredNotifier = ValueNotifier<bool>(
    _totalSecondsNotifier.value <= 0,
  );

  @override
  void initState() {
    super.initState();
    _biddingStatusHelper = BiddingStatusHelper(
      context: context,
      requestId: widget.requestId,
      bidId: widget.bidId,
      totalSecondsNotifier: _totalSecondsNotifier,
      isExpiredNotifier: _isExpiredNotifier,
      baseBidAmount: widget.baseBidAmount,
      currentMinimumBid: widget.currentMinBid,
    );
    if (!_isExpiredNotifier.value) {
      _biddingStatusHelper.startTimer();
    } else {
      _biddingStatusHelper.cancelTimer();
    }
  }

  @override
  void dispose() {
    _biddingStatusHelper.cancelTimer();
    _totalSecondsNotifier.dispose();
    _isExpiredNotifier.dispose();
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
      body: MultiBlocListener(
        listeners: [
          BlocListener<BidStatusCubit, BidStatusState>(
            listener: (context, state) {
              switch (state) {
                case BidStatusSuccess(
                  bid: final bid,
                  deliveryRequest: final deliveryRequest,
                ):
                  switch (bid.bidStatus) {
                    case BidStatus.approved:
                      CustomSnackbar.showSuccess(
                        context: context,
                        message: 'Your bid has been accepted.',
                      );
                      Navigator.pushReplacement(
                        context,
                        BidResultPage.route(
                          isBidAccepted: true,
                          pickupAddress: deliveryRequest.pickupAddress,
                          dropoffAddress: deliveryRequest.dropOffAddress,
                        ),
                      );
                      break;
                    case BidStatus.rejected:
                      CustomSnackbar.showError(
                        context: context,
                        message: 'Your bid has been rejected.',
                      );
                      Navigator.pushReplacement(
                        context,
                        BidResultPage.route(
                          isBidAccepted: false,
                          pickupAddress: deliveryRequest.pickupAddress,
                          dropoffAddress: deliveryRequest.dropOffAddress,
                        ),
                      );
                      break;
                    default:
                      break;
                  }
                  break;
                default:
              }
            },
          ),
          BlocListener<BargainActionBloc, BargainActionState>(
            listener: (context, state) {
              switch (state) {
                case BargainActionLoading(message: final message):
                  OverlayLoader.show(context, message: message);
                  break;
                case AcceptBargainSuccess _:
                  OverlayLoader.hide();
                  CustomSnackbar.showInfo(
                    context: context,
                    message: 'Bargain accepted successfully.',
                  );
                  break;
                case RejectBargainSuccess _:
                  OverlayLoader.hide();
                  CustomSnackbar.showInfo(
                    context: context,
                    message: 'Bargain rejected successfully.',
                  );
                  break;
                case BargainActionError(message: final message):
                  OverlayLoader.hide();
                  CustomSnackbar.showError(context: context, message: message);
                  break;
                default:
                  OverlayLoader.hide();
                  break;
              }
            },
          ),
        ],
        child: BlocBuilder<BidStatusCubit, BidStatusState>(
          builder: (context, state) {
            return switch (state) {
              BidStatusInitial() => const SizedBox.shrink(),
              BidStatusLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              BidStatusError(message: final message) => CustomErrorWidget(
                errorMessage: message,
                isDark: isDark,
                onRetry: () => context.read<BidStatusCubit>().getBidStatus(
                  requestId: widget.requestId,
                  bidId: widget.bidId,
                ),
              ),
              BidStatusSuccess(
                bid: final bid,
                deliveryRequest: final deliveryRequest,
              ) =>
                SafeArea(
                  child: Center(
                    child: Container(
                      color: colorScheme.backgroundColor,
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(
                          responsiveSizes.horizontalPadding,
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight * 0.04),
                            // Bid Information Card
                            BidInfoCard(
                              colorScheme: colorScheme,
                              responsiveSizes: responsiveSizes,
                              baseBidAmount: deliveryRequest.baseDeliveryCharge,
                              currentMinBid:
                                  deliveryRequest.minimumDeliveryCharge,
                              currentBid: bid.bidAmount,
                            ),
                            SizedBox(height: screenHeight * 0.04),

                            // Bargain Card - Only show if bargain section is visible and has valid bargain
                            bid.bargainAmount != null
                                ? BargainCard(
                                    colorScheme: colorScheme,
                                    responsiveSizes: responsiveSizes,
                                    bargainAmount: bid.bargainAmount,
                                    isExpiredNotifier: _isExpiredNotifier,
                                    onAccept: () {
                                      if (bid.bargainAmount != null) {
                                        _biddingStatusHelper
                                            .handleAcceptBargain(
                                              bid.bargainAmount!,
                                            );
                                      }
                                    },
                                    onReject: () {
                                      _biddingStatusHelper
                                          .handleRejectBargain();
                                    },
                                  )
                                : const SizedBox.shrink(),
                            SizedBox(height: screenHeight * 0.04),
                            // Countdown Timer Card
                            CountdownCard(
                              colorScheme: colorScheme,
                              responsiveSizes: responsiveSizes,
                              totalSecondsNotifier: _totalSecondsNotifier,
                              isExpiredNotifier: _isExpiredNotifier,
                            ),
                            SizedBox(height: screenHeight * 0.04),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            };
          },
        ),
      ),
    );
  }
}
