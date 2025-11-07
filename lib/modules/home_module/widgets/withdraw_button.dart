import 'package:flutter/material.dart';

class WithdrawButton extends StatelessWidget {
  final Color primaryColor;
  final Color textPrimaryColor;

  const WithdrawButton({
    super.key,
    required this.primaryColor,
    required this.textPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle withdraw action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: textPrimaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(9999),
          ),
          elevation: 6,
          shadowColor: Colors.black.withValues(alpha: 0.07),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_balance_wallet, size: 20),
            SizedBox(width: 8),
            Text(
              'Withdraw Funds',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
