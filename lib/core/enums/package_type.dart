import 'package:flutter/material.dart';

enum PackageType {
  document('Document'),
  smallBox('Small Box'),
  largeBox('Large Box'),
  fragile('Fragile');

  final String value;
  const PackageType(this.value);

  factory PackageType.fromString(String name) {
    return PackageType.values.firstWhere((e) => e.value == name);
  }

  IconData get icon {
    switch (this) {
      case PackageType.document:
        return Icons.description;
      case PackageType.smallBox:
        return Icons.inventory_2;
      case PackageType.largeBox:
        return Icons.all_inbox;
      case PackageType.fragile:
        return Icons.wine_bar;
    }
  }

  String toJson() => value;
}
