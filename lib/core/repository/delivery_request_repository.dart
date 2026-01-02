import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:throw_delivery/core/exports/enum_exports.dart';
import 'package:throw_delivery/core/exports/exception_exports.dart';
import 'package:throw_delivery/core/models/bid_model.dart';
import 'package:throw_delivery/core/models/delivery_agent_model.dart';
import 'package:throw_delivery/core/models/delivery_request_model.dart';

class DeliveryRequestRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  // Collection reference
  static const String deliveryRequestCollection = 'deliveryRequest';
  static const String deliveryAgentsCollection = 'deliveryAgents';
  static const String bidsCollection = 'bids';

  // Get user by UID
  Future<List<DeliveryRequestModel>> getActiveDeliveryRequests() async {
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

  Stream<BidModel> getBidDetails(String requestId, String bidId) {
    try {
      return _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .collection(bidsCollection)
          .doc(bidId)
          .snapshots()
          .map((doc) {
            if (!doc.exists) {
              throw Exception('Bid not found');
            }
            return BidModel.fromJson(doc.data()!);
          });
    } catch (e) {
      debugPrint('Error getting bid details: $e');
      throw DeliveryRequestRepositoryException('Error getting bid details: $e');
    }
  }

  // Place bid
  Future<String> placeBid(
    String agentId,
    String requestId,
    double bidAmount,
  ) async {
    try {
      final doc = await _firestore
          .collection(deliveryAgentsCollection)
          .doc(agentId)
          .get();

      if (!doc.exists) {
        throw Exception('Agent not found');
      }

      final DeliveryAgentModel agent = DeliveryAgentModel.fromJson(doc.data()!);

      final requestDoc = await _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .get();

      final DeliveryRequestModel requestData = DeliveryRequestModel.fromJson(
        requestDoc.data()!,
      );

      if (requestData.minimumDeliveryCharge > bidAmount) {
        final Map<String, dynamic> requestDataUpdate = {
          'minimumDeliveryCharge': bidAmount,
          'updatedAt': FieldValue.serverTimestamp(),
        };

        await _firestore
            .collection(deliveryRequestCollection)
            .doc(requestId)
            .update(requestDataUpdate);
      }

      final Map<String, dynamic> bidData = {
        'agentId': agentId,
        'agentName': agent.displayName,
        'agentAvatarUrl': agent.photoUrl,
        'agentAverageRating': agent.averageRating,
        'bidAmount': bidAmount,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
        'bidStatus': BidStatus.pending.value,
      };

      final docRef = _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .collection(bidsCollection)
          .doc();

      bidData['bidId'] = docRef.id;
      await docRef.set(bidData);
      return docRef.id;
    } catch (e) {
      debugPrint('Error placing bid: $e');
      throw DeliveryRequestRepositoryException('Error placing bid: $e');
    }
  }

  // Accept Bargain
  Future<void> acceptBargain({
    required String requestId,
    required String bidId,
    required double bargainAmount,
  }) async {
    try {
      final requestDoc = await _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .get();

      final DeliveryRequestModel requestData = DeliveryRequestModel.fromJson(
        requestDoc.data()!,
      );

      if (requestData.minimumDeliveryCharge > bargainAmount) {
        final Map<String, dynamic> requestDataUpdate = {
          'minimumDeliveryCharge': bargainAmount,
          'updatedAt': FieldValue.serverTimestamp(),
        };

        await _firestore
            .collection(deliveryRequestCollection)
            .doc(requestId)
            .update(requestDataUpdate);
      }

      final Map<String, dynamic> bidData = {
        'bargainAmount': null,
        'bidAmount': bargainAmount,
        'updatedAt': FieldValue.serverTimestamp(),
      };
      final docRef = _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .collection(bidsCollection)
          .doc(bidId);

      await docRef.update(bidData);
    } catch (e) {
      debugPrint('Error accepting bargain: $e');
      throw DeliveryRequestRepositoryException('Error accepting bargain: $e');
    }
  }

  // Reject Bargain
  Future<void> rejectBargain({
    required String requestId,
    required String bidId,
  }) async {
    try {
      final Map<String, dynamic> bidData = {
        'bargainAmount': null,
        'updatedAt': FieldValue.serverTimestamp(),
      };
      final docRef = _firestore
          .collection(deliveryRequestCollection)
          .doc(requestId)
          .collection(bidsCollection)
          .doc(bidId);

      await docRef.update(bidData);
    } catch (e) {
      debugPrint('Error rejecting bargain: $e');
      throw DeliveryRequestRepositoryException('Error rejecting bargain: $e');
    }
  }
}
