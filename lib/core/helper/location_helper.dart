import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

class LocationHelper {
  /// Calculates the distance between two [GeoPoint] coordinates in kilometers
  /// using the Haversine formula.
  static double calculateDistance(GeoPoint p1, GeoPoint p2) {
    const double earthRadius = 6371; // Radius of the earth in km

    double dLat = _toRadians(p2.latitude - p1.latitude);
    double dLon = _toRadians(p2.longitude - p1.longitude);

    double a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(p1.latitude)) *
            cos(_toRadians(p2.latitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  static double _toRadians(double degree) {
    return degree * pi / 180;
  }
}
