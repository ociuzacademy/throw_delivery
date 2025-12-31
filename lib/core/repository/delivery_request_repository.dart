import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:throw_delivery/core/exports/enum_exports.dart';
import 'package:throw_delivery/core/exports/exception_exports.dart';
import 'package:throw_delivery/core/models/delivery_request_model.dart';

class DeliveryRequestRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  // Collection reference
  static const String deliveryRequestCollection = 'deliveryRequest';

  // Get user by UID
  Future<List<DeliveryRequestModel>> getDeliveryRequestByUid() async {
    try {
      final doc = await _firestore
          .collection(deliveryRequestCollection)
          .where('requestStatus', isEqualTo: RequestStatus.requestCreated.value)
          .orderBy('createdAt', descending: true)
          .get();

      debugPrint(doc.docs.toString());

      return doc.docs
          .map((doc) => DeliveryRequestModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      debugPrint('Error getting active delivery requests: $e');
      throw DeliveryRequestRepositoryException(
        'Error getting active delivery requests: $e',
      );
    }
  }

  Future<DeliveryRequestModel> getDeliveryRequestById(String requestId) async {
    try {
      final doc = await _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .get();

      debugPrint(doc.data().toString());

      return DeliveryRequestModel.fromJson(doc.data()!);
    } catch (e) {
      debugPrint('Error getting delivery request details by id $requestId: $e');
      throw DeliveryRequestRepositoryException(
        'Error getting delivery request details by id $requestId: $e',
      );
    }
  }
}
