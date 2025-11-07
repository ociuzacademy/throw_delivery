// lib/widgets/review_item.dart

import 'package:flutter/material.dart';
import 'package:throw_delivery/core/theme/app_colors.dart';

class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.rating});

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < rating ? AppColors.yellow : Colors.grey.shade300,
          size: 18,
        );
      }),
    );
  }
}
