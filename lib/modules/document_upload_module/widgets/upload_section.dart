// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/document_upload_module/utils/upload_section_helper.dart';

class UploadSection extends StatelessWidget {
  const UploadSection({
    super.key,
    required this.title,
    required this.subtitle,
    required this.defaultImageUrl,
    required this.pickedImage,
    required this.onUploadPressed,
    required this.screenWidth,
  });

  final String title;
  final String subtitle;
  final String defaultImageUrl;
  final File? pickedImage;
  final VoidCallback onUploadPressed;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Calculate responsive values
    final cardPadding = UploadSectionHelper.getCardPadding(screenWidth);
    final titleFontSize = UploadSectionHelper.getTitleFontSize(screenWidth);
    final subtitleFontSize = UploadSectionHelper.getSubtitleFontSize(
      screenWidth,
    );
    final successFontSize = UploadSectionHelper.getSuccessFontSize(screenWidth);
    final imageWidth = UploadSectionHelper.getImageWidth(screenWidth);
    final imageHeight = UploadSectionHelper.getImageHeight(screenWidth);
    final buttonFontSize = UploadSectionHelper.getButtonFontSize(screenWidth);
    final iconSize = UploadSectionHelper.getIconSize(screenWidth);
    final checkIconSize = UploadSectionHelper.getCheckIconSize(screenWidth);
    final spacing = UploadSectionHelper.getSpacing(screenWidth);
    final borderRadius = UploadSectionHelper.getBorderRadius(screenWidth);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(cardPadding),
      decoration: BoxDecoration(
        color: isDark ? Color(0xFF0F1C23).withValues(alpha: 0.5) : Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF00AAFF),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        fontSize: subtitleFontSize,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.grey[900],
                      ),
                    ),
                    if (pickedImage != null) ...[
                      SizedBox(height: 4),
                      Text(
                        '✓ Image uploaded successfully',
                        style: GoogleFonts.inter(
                          fontSize: successFontSize,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              SizedBox(width: spacing),
              Container(
                width: imageWidth,
                height: imageHeight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius - 4),
                  border: Border.all(
                    color: isDark ? Colors.grey[600]! : Colors.grey[300]!,
                  ),
                  image: DecorationImage(
                    image: pickedImage != null
                        ? FileImage(pickedImage!) as ImageProvider
                        : NetworkImage(defaultImageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: pickedImage == null
                    ? null
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(borderRadius - 4),
                        ),
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: checkIconSize,
                        ),
                      ),
              ),
            ],
          ),
          SizedBox(height: spacing),
          OutlinedButton(
            onPressed: onUploadPressed,
            style: OutlinedButton.styleFrom(
              foregroundColor: Color(0xFF00AAFF),
              backgroundColor: Color(0xFF00AAFF).withValues(alpha: 0.1),
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius - 4),
              ),
              minimumSize: Size(double.infinity, screenWidth < 600 ? 36 : 40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.file_upload_outlined, size: iconSize),
                SizedBox(width: 8),
                Text(
                  pickedImage != null ? 'Change $subtitle' : 'Upload $subtitle',
                  style: GoogleFonts.inter(
                    fontSize: buttonFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
