import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:throw_delivery/core/models/auth_response.dart';
import 'package:throw_delivery/core/models/delivery_agent_model.dart';
import 'package:throw_delivery/modules/vehicle_register_module/classes/vehicle_data.dart';

class DeliveryAgentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );

  // Collection reference
  static const String deliveryAgentsCollection = 'deliveryAgents';

  // Create or update user in Firestore
  Future<void> createOrUpdateUser(UserProfile userProfile) async {
    try {
      final docRef = _firestore
          .collection(deliveryAgentsCollection)
          .doc(userProfile.uid);
      final docSnap = await docRef.get();

      final Map<String, dynamic> deliveryAgentData = {
        'uid': userProfile.uid,
        'displayName': userProfile.displayName,
        'email': userProfile.email,
        'phoneNumber': userProfile.phoneNumber ?? '',
        'photoUrl': userProfile.photoUrl ?? '',
      };

      // Only set initial flags if the document doesn't exist
      // or if they are missing from the existing document
      if (!docSnap.exists) {
        deliveryAgentData['hasApproved'] = false;
        deliveryAgentData['hasVehicleRegistered'] = false;
        deliveryAgentData['hasDocumentUploaded'] = false;
      } else {
        final data = docSnap.data();
        if (data != null) {
          // Preserve existing values if they exist, otherwise initialize
          if (!data.containsKey('hasApproved')) {
            deliveryAgentData['hasApproved'] = false;
          }
          if (!data.containsKey('hasVehicleRegistered')) {
            deliveryAgentData['hasVehicleRegistered'] = false;
          }
          if (!data.containsKey('hasDocumentUploaded')) {
            deliveryAgentData['hasDocumentUploaded'] = false;
          }
        }
      }

      // Use UID as document ID for easy lookup
      await docRef.set(deliveryAgentData, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error saving user to Firestore: $e');
      rethrow;
    }
  }

  // Update vehicle details in Firestore
  Future<void> addVehicleDetails(String uid, VehicleData vehicleData) async {
    try {
      final agentVehicleData = {
        'vehicleNumber': vehicleData.vehicleNumber,
        'vehicleType': vehicleData.vehicleType,
        'vehicleModel': vehicleData.vehicleModel,
        'hasVehicleRegistered': true,
      };

      // Use UID as document ID for easy lookup
      await _firestore
          .collection(deliveryAgentsCollection)
          .doc(uid)
          .set(
            agentVehicleData,
            SetOptions(merge: true),
          ); // merge: true updates instead of overwriting
    } catch (e) {
      debugPrint('Error saving user to Firestore: $e');
      rethrow;
    }
  }

  // Update license image in Firestore
  Future<void> addLicenseImage(String uid, String licenseImage) async {
    try {
      final agentLicenseData = {
        'licenseImageUrl': licenseImage,
        'hasDocumentUploaded': true,
      };

      // Use UID as document ID for easy lookup
      await _firestore
          .collection(deliveryAgentsCollection)
          .doc(uid)
          .set(
            agentLicenseData,
            SetOptions(merge: true),
          ); // merge: true updates instead of overwriting
    } catch (e) {
      debugPrint('Error saving user to Firestore: $e');
      rethrow;
    }
  }

  // Get delivery agent by UID
  Future<DeliveryAgentModel?> getDeliveryAgentByUid(String uid) async {
    try {
      final doc = await _firestore
          .collection(deliveryAgentsCollection)
          .doc(uid)
          .get();

      return doc.exists ? DeliveryAgentModel.fromJson(doc.data()!) : null;
    } catch (e) {
      debugPrint('Error getting user: $e');
      return null;
    }
  }

  // Check if delivery agent exists in database
  Future<bool> deliveryAgentExists(String uid) async {
    try {
      final doc = await _firestore
          .collection(deliveryAgentsCollection)
          .doc(uid)
          .get();

      return doc.exists;
    } catch (e) {
      return false;
    }
  }
}
