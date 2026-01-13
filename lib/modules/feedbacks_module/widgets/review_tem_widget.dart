// lib/widgets/review_item.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/core/models/feedback_model.dart';
import 'package:throw_delivery/core/theme/app_colors.dart';
import 'package:throw_delivery/modules/feedbacks_module/widgets/star_rating.dart';
import 'package:timeago/timeago.dart' as timeago;

class ReviewItemWidget extends StatelessWidget {
  final FeedbackModel feedback;

  const ReviewItemWidget({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final dateString = timeago.format(feedback.createdAt.toDate());

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
              backgroundImage: CachedNetworkImageProvider(
                feedback.userAvatarImageUrl,
              ),
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
                        feedback.userName,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode
                              ? AppColors.darkTextPrimary
                              : AppColors.lightTextPrimary,
                        ),
                      ),
                      Text(
                        dateString,
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
                  StarRating(rating: feedback.rating),
                  const SizedBox(height: 8),
                  Text(
                    feedback.comments,
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
