class DeliveryRequestRepositoryException implements Exception {
  final String message;

  DeliveryRequestRepositoryException(this.message);

  @override
  String toString() => 'DeliveryRequestRepositoryException: $message';
}
