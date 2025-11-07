// lib/widgets/review_item.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/theme/app_colors.dart';
import 'package:throw_delivery/modules/feedbacks_module/widgets/star_rating.dart';

class ReviewItem {
  final String id;
  final String customerName;
  final String avatarUrl;
  final int rating;
  final String comment;
  final String timeAgo;

  ReviewItem({
    required this.id,
    required this.customerName,
    required this.avatarUrl,
    required this.rating,
    required this.comment,
    required this.timeAgo,
  });
}

class ReviewItemWidget extends StatelessWidget {
  final ReviewItem review;

  const ReviewItemWidget({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: isDarkMode ? AppColors.darkCard : AppColors.lightCard,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(review.avatarUrl),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        review.customerName,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode
                              ? AppColors.darkTextPrimary
                              : AppColors.lightTextPrimary,
                        ),
                      ),
                      Text(
                        review.timeAgo,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: isDarkMode
                              ? AppColors.darkTextSecondary
                              : AppColors.lightTextSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  StarRating(rating: review.rating),
                  const SizedBox(height: 8),
                  Text(
                    review.comment,
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
          ],
        ),
      ),
    );
  }
}
