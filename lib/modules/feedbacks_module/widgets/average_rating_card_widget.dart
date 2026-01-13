// lib/widgets/average_rating_card.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/theme/app_colors.dart';
import 'package:throw_delivery/modules/feedbacks_module/widgets/star_rating_widget.dart';

class AverageRatingCard extends StatelessWidget {
  final double rating;
  final int reviewCount;

  const AverageRatingCard({
    super.key,
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Average Rating',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isDarkMode
                    ? AppColors.darkTextPrimary
                    : AppColors.lightTextPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(
                  rating.toStringAsFixed(1),
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 12),
                StarRatingWidget(rating: rating),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              'Based on $reviewCount reviews',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: isDarkMode
                    ? AppColors.darkTextSecondary
                    : AppColors.lightTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
