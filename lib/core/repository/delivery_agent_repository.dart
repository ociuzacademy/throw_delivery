// delivery_agent_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:throw_delivery/core/models/auth_response.dart';
import 'package:throw_delivery/core/models/delivery_agent_model.dart';
import 'package:throw_delivery/core/service/storage_service.dart';
import 'package:throw_delivery/modules/vehicle_register_module/classes/vehicle_data.dart';

class DeliveryAgentRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instanceFor(
    app: Firebase.app(),
    databaseId: 'throw',
  );
  final StorageService _storageService = StorageService();

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
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      };

      // Only set initial flags if the document doesn't exist
      // or if they are missing from the existing document
      if (!docSnap.exists) {
        deliveryAgentData.addAll({
          'hasApproved': false,
          'hasVehicleRegistered': false,
          'hasDocumentUploaded': false,
          'status': 'pending', // pending, approved, rejected
        });
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
          if (!data.containsKey('status')) {
            deliveryAgentData['status'] = 'pending';
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
        'updatedAt': FieldValue.serverTimestamp(),
      };

      // Use UID as document ID for easy lookup
      await _firestore
          .collection(deliveryAgentsCollection)
          .doc(uid)
          .set(agentVehicleData, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error saving vehicle details to Firestore: $e');
      rethrow;
    }
  }

  // UPLOAD license image AND store URL in Firestore
  Future<String> uploadLicenseImage({
    required String uid,
    required String imagePath,
  }) async {
    try {
      // 1. Upload image to Firebase Storage
      final String downloadUrl = await _storageService.uploadImage(
        uid: uid,
        imagePath: imagePath,
        imageType: 'license',
      );

      // 2. Update Firestore with the download URL
      await _addLicenseImageUrl(uid, downloadUrl);

      return downloadUrl;
    } catch (e) {
      debugPrint('Error uploading license image: $e');
      rethrow;
    }
  }

  // Private method to update license image URL in Firestore
  Future<void> _addLicenseImageUrl(String uid, String licenseImageUrl) async {
    try {
      final agentLicenseData = {
        'licenseImageUrl': licenseImageUrl,
        'hasDocumentUploaded': true,
        'updatedAt': FieldValue.serverTimestamp(),
      };

      await _firestore
          .collection(deliveryAgentsCollection)
          .doc(uid)
          .set(agentLicenseData, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Error saving license URL to Firestore: $e');
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
