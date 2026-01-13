// lib/widgets/average_rating_card.dart

import 'package:flutter/material.dart';
import 'package:throw_delivery/core/theme/app_colors.dart';

class StarRatingWidget extends StatelessWidget {
  const StarRatingWidget({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;

    return Row(
      children: List.generate(5, (index) {
        if (index < fullStars) {
          return const Icon(Icons.star, color: AppColors.yellow, size: 28);
        } else if (index == fullStars && hasHalfStar) {
          return const Icon(Icons.star_half, color: AppColors.yellow, size: 28);
        } else {
          return Icon(Icons.star, color: Colors.grey.shade300, size: 28);
        }
      }),
    );
  }
}
