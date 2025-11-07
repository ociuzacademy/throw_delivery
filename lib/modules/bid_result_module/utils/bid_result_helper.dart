// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_delivery/modules/home_module/view/home_page.dart';

class BidResultHelper {
  const BidResultHelper();
  static void goToHomePage(BuildContext context, bool isBidAccepted) {
    if (isBidAccepted) {
      CustomSnackbar.showInfo(
        context: context,
        message: 'Going back to home page...',
      );
    } else {
      CustomSnackbar.showInfo(
        context: context,
        message: 'Finding other deliveries...',
      );
    }
    Navigator.pushAndRemoveUntil(context, HomePage.route(), (_) => false);
  }
}
