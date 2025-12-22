// To parse this JSON data, do
//
//     final deliveryAgentModel = deliveryAgentModelFromJson(jsonString);

import 'dart:convert';

DeliveryAgentModel deliveryAgentModelFromJson(String str) =>
    DeliveryAgentModel.fromJson(json.decode(str));

String deliveryAgentModelToJson(DeliveryAgentModel data) =>
    json.encode(data.toJson());

class DeliveryAgentModel {
  final String uid;
  final String displayName;
  final String email;
  final String phoneNumber;
  final String photoUrl;
  final String? vehicleModel;
  final String? vehicleNumber;
  final String? vehicleType;
  final String? licenseImageUrl;
  final bool hasApproved;
  final bool hasVehicleRegistered;
  final bool hasDocumentUploaded;

  DeliveryAgentModel({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.phoneNumber,
    required this.photoUrl,
    this.vehicleModel,
    this.vehicleNumber,
    this.vehicleType,
    this.licenseImageUrl,
    required this.hasApproved,
    required this.hasVehicleRegistered,
    required this.hasDocumentUploaded,
  });

  DeliveryAgentModel copyWith({
    String? uid,
    String? displayName,
    String? email,
    String? phoneNumber,
    String? photoUrl,
    String? vehicleModel,
    String? vehicleNumber,
    String? vehicleType,
    String? licenseImageUrl,
    bool? hasApproved,
    bool? hasVehicleRegistered,
    bool? hasDocumentUploaded,
  }) => DeliveryAgentModel(
    uid: uid ?? this.uid,
    displayName: displayName ?? this.displayName,
    email: email ?? this.email,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    photoUrl: photoUrl ?? this.photoUrl,
    vehicleModel: vehicleModel ?? this.vehicleModel,
    vehicleNumber: vehicleNumber ?? this.vehicleNumber,
    vehicleType: vehicleType ?? this.vehicleType,
    licenseImageUrl: licenseImageUrl ?? this.licenseImageUrl,
    hasApproved: hasApproved ?? this.hasApproved,
    hasVehicleRegistered: hasVehicleRegistered ?? this.hasVehicleRegistered,
    hasDocumentUploaded: hasDocumentUploaded ?? this.hasDocumentUploaded,
  );

  factory DeliveryAgentModel.fromJson(Map<String, dynamic> json) =>
      DeliveryAgentModel(
        uid: json['uid'] as String? ?? '',
        displayName: json['displayName'] as String? ?? '',
        email: json['email'] as String? ?? '',
        phoneNumber: json['phoneNumber'] as String? ?? '',
        photoUrl: json['photoUrl'] as String? ?? '',
        vehicleModel: json['vehicleModel'] as String? ?? '',
        vehicleNumber: json['vehicleNumber'] as String? ?? '',
        vehicleType: json['vehicleType'] as String? ?? '',
        licenseImageUrl: json['licenseImageUrl'] as String? ?? '',
        hasApproved: json['hasApproved'] as bool? ?? false,
        hasVehicleRegistered: json['hasVehicleRegistered'] as bool? ?? false,
        hasDocumentUploaded: json['hasDocumentUploaded'] as bool? ?? false,
      );

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'displayName': displayName,
    'email': email,
    'phoneNumber': phoneNumber,
    'photoUrl': photoUrl,
    'vehicleModel': vehicleModel,
    'vehicleNumber': vehicleNumber,
    'vehicleType': vehicleType,
    'licenseImageUrl': licenseImageUrl,
    'hasApproved': hasApproved,
    'hasVehicleRegistered': hasVehicleRegistered,
    'hasDocumentUploaded': hasDocumentUploaded,
  };
}
