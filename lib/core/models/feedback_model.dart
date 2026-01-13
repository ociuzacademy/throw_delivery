// To parse this JSON data, do
//
//     final feedbackModel = feedbackModelFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

FeedbackModel feedbackModelFromJson(String str) =>
    FeedbackModel.fromJson(json.decode(str));

String feedbackModelToJson(FeedbackModel data) => json.encode(data.toJson());

class FeedbackModel {
  final DocumentReference<Map<String, dynamic>> deliveryRequestRef;
  final String comments;
  final int rating;
  final String userName;
  final String userAvatarImageUrl;
  final String deliveryAgentUid;
  final Timestamp createdAt;

  FeedbackModel({
    required this.deliveryRequestRef,
    required this.comments,
    required this.rating,
    required this.userName,
    required this.userAvatarImageUrl,
    required this.deliveryAgentUid,
    required this.createdAt,
  });

  FeedbackModel copyWith({
    DocumentReference<Map<String, dynamic>>? deliveryRequestRef,
    String? comments,
    int? rating,
    String? userName,
    String? userAvatarImageUrl,
    String? deliveryAgentUid,
    Timestamp? createdAt,
  }) => FeedbackModel(
    deliveryRequestRef: deliveryRequestRef ?? this.deliveryRequestRef,
    comments: comments ?? this.comments,
    rating: rating ?? this.rating,
    userName: userName ?? this.userName,
    userAvatarImageUrl: userAvatarImageUrl ?? this.userAvatarImageUrl,
    deliveryAgentUid: deliveryAgentUid ?? this.deliveryAgentUid,
    createdAt: createdAt ?? this.createdAt,
  );

  factory FeedbackModel.fromJson(Map<String, dynamic> json) => FeedbackModel(
    deliveryRequestRef:
        json['deliveryRequestRef'] as DocumentReference<Map<String, dynamic>>,
    comments: json['comments'],
    rating: json['rating'],
    userName: json['userName'],
    userAvatarImageUrl: json['userAvatarImageUrl'],
    deliveryAgentUid: json['deliveryAgentUid'],
    createdAt: json['createdAt'] != null
        ? json['createdAt'] as Timestamp
        : Timestamp.now(),
  );

  Map<String, dynamic> toJson() => {
    'deliveryRequestRef': deliveryRequestRef,
    'comments': comments,
    'rating': rating,
    'userName': userName,
    'userAvatarImageUrl': userAvatarImageUrl,
    'deliveryAgentUid': deliveryAgentUid,
    'createdAt':
        "${createdAt.toDate().year.toString().padLeft(4, '0')}-${createdAt.toDate().month.toString().padLeft(2, '0')}-${createdAt.toDate().day.toString().padLeft(2, '0')}",
  };
}
