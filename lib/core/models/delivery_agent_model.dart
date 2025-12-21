// To parse this JSON data, do
//
//     final deliveryAgentModel = deliveryAgentModelFromJson(jsonString);

import 'dart:convert';

DeliveryAgentModel deliveryAgentModelFromJson(String str) =>
    DeliveryAgentModel.fromJson(json.decode(str));

String deliveryAgentModelToJson(DeliveryAgentModel data) =>
    json.encode(data.toJson());

class DeliveryAgentModel {
  final String displayName;
  final String email;
  final bool isApproved;
  final String licenseImageUrl;
  final String phoneNumber;
  final String photoUrl;
  final String uid;
  final String vehicleModel;
  final String vehicleNumber;
  final String vehicleType;
  final bool isRegistered;

  DeliveryAgentModel({
    required this.displayName,
    required this.email,
    required this.isApproved,
    required this.licenseImageUrl,
    required this.phoneNumber,
    required this.photoUrl,
    required this.uid,
    required this.vehicleModel,
    required this.vehicleNumber,
    required this.vehicleType,
    required this.isRegistered,
  });

  DeliveryAgentModel copyWith({
    String? displayName,
    String? email,
    bool? isApproved,
    String? licenseImageUrl,
    String? phoneNumber,
    String? photoUrl,
    String? uid,
    String? vehicleModel,
    String? vehicleNumber,
    String? vehicleType,
    bool? isRegistered,
  }) => DeliveryAgentModel(
    displayName: displayName ?? this.displayName,
    email: email ?? this.email,
    isApproved: isApproved ?? this.isApproved,
    licenseImageUrl: licenseImageUrl ?? this.licenseImageUrl,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    photoUrl: photoUrl ?? this.photoUrl,
    uid: uid ?? this.uid,
    vehicleModel: vehicleModel ?? this.vehicleModel,
    vehicleNumber: vehicleNumber ?? this.vehicleNumber,
    vehicleType: vehicleType ?? this.vehicleType,
    isRegistered: isRegistered ?? this.isRegistered,
  );

  factory DeliveryAgentModel.fromJson(Map<String, dynamic> json) =>
      DeliveryAgentModel(
        displayName: json['displayName'] ?? '',
        email: json['email'] ?? '',
        isApproved: json['isApproved'] ?? false,
        licenseImageUrl: json['licenseImageUrl'] ?? '',
        phoneNumber: json['phoneNumber'] ?? '',
        photoUrl: json['photoUrl'] ?? '',
        uid: json['uid'] ?? '',
        vehicleModel: json['vehicleModel'] ?? '',
        vehicleNumber: json['vehicleNumber'] ?? '',
        vehicleType: json['vehicleType'] ?? '',
        isRegistered: json['isRegistered'] ?? false,
      );

  Map<String, dynamic> toJson() => {
    'displayName': displayName,
    'email': email,
    'isApproved': isApproved,
    'licenseImageUrl': licenseImageUrl,
    'phoneNumber': phoneNumber,
    'photoUrl': photoUrl,
    'uid': uid,
    'vehicleModel': vehicleModel,
    'vehicleNumber': vehicleNumber,
    'vehicleType': vehicleType,
    'isRegistered': isRegistered,
  };
}
