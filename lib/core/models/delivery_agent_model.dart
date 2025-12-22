// To parse this JSON data, do
//
//     final deliveryAgentModel = deliveryAgentModelFromJson(jsonString);

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:throw_delivery/core/enums/appoval_status.dart';

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
  final AppovalStatus status;
  final bool hasVehicleRegistered;
  final bool hasDocumentUploaded;
  final DateTime createdAt;
  final DateTime updatedAt;

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
    required this.status,
    required this.hasVehicleRegistered,
    required this.hasDocumentUploaded,
    required this.createdAt,
    required this.updatedAt,
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
    AppovalStatus? status,
    bool? hasVehicleRegistered,
    bool? hasDocumentUploaded,
    DateTime? createdAt,
    DateTime? updatedAt,
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
    status: status ?? this.status,
    hasVehicleRegistered: hasVehicleRegistered ?? this.hasVehicleRegistered,
    hasDocumentUploaded: hasDocumentUploaded ?? this.hasDocumentUploaded,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  factory DeliveryAgentModel.fromJson(Map<String, dynamic> json) =>
      DeliveryAgentModel(
        uid: json['uid'] as String? ?? '',
        displayName: json['displayName'] as String? ?? '',
        email: json['email'] as String? ?? '',
        phoneNumber: json['phoneNumber'] as String? ?? '',
        photoUrl: json['photoUrl'] as String? ?? '',
        vehicleModel: json['vehicleModel'] as String?,
        vehicleNumber: json['vehicleNumber'] as String?,
        vehicleType: json['vehicleType'] as String?,
        licenseImageUrl: json['licenseImageUrl'] as String?,
        status: AppovalStatus.fromString(json['status'] as String?),
        hasVehicleRegistered: json['hasVehicleRegistered'] as bool? ?? false,
        hasDocumentUploaded: json['hasDocumentUploaded'] as bool? ?? false,
        createdAt: _parseDateTime(json['createdAt']),
        updatedAt: _parseDateTime(json['updatedAt']),
      );

  static DateTime _parseDateTime(dynamic value) {
    if (value is Timestamp) return value.toDate();
    if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
    return DateTime.now();
  }

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
    'status': status.value,
    'hasVehicleRegistered': hasVehicleRegistered,
    'hasDocumentUploaded': hasDocumentUploaded,
    'createdAt':
        "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
    'updatedAt':
        "${updatedAt.year.toString().padLeft(4, '0')}-${updatedAt.month.toString().padLeft(2, '0')}-${updatedAt.day.toString().padLeft(2, '0')}",
  };
}
