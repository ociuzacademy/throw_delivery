import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:throw_delivery/core/exports/exception_exports.dart';
import 'package:throw_delivery/core/models/feedback_model.dart';

class FeedbackRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  static const String feedbackCollection = 'feedback';

  Future<List<FeedbackModel>> getFeedbackForDeliveryAgent(
    String deliveryAgentUid,
  ) async {
    try {
      final querySnapshot = await _firestore
          .collection(feedbackCollection)
          .where('deliveryAgentUid', isEqualTo: deliveryAgentUid)
          .orderBy('createdAt', descending: true)
          .get();

      return querySnapshot.docs
          .map((doc) => FeedbackModel.fromJson(doc.data()))
          .toList();
    } catch (e, stack) {
      debugPrint('Error fetching feedback: $e\n$stack');
      throw FeedbackRepositoryException(
        message: 'Failed to fetch feedback. Please try again.',
      );
    }
  }
}
