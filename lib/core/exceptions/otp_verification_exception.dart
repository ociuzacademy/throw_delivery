class OTPVerificationException implements Exception {
  OTPVerificationException();

  @override
  String toString() {
    return 'OTPVerificationException(message: Invalid OTP.)';
  }
}
