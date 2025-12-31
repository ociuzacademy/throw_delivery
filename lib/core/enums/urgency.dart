import 'package:flutter/material.dart';

enum Urgency {
  standard('Standard'),
  express('Express'),
  overnight('Overnight');

  final String value;
  const Urgency(this.value);

  factory Urgency.fromString(String name) {
    return Urgency.values.firstWhere((e) => e.value == name);
  }

  Color get color {
    switch (this) {
      case Urgency.standard:
        return const Color(0xFFEF4444);
      case Urgency.express:
        return const Color(0xFF10B981);
      case Urgency.overnight:
        return const Color(0xFF8B5CF6);
    }
  }

  String toJson() => value;
}
