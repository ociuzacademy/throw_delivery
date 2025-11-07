// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:throw_delivery/modules/register_module/utils/register_helper.dart';

typedef UploadImage = Future<void> Function();

class ProfileSection extends StatelessWidget {
  final bool isDark;
  final double screenWidth;
  final File? imageFile;
  final UploadImage pickImage;
  const ProfileSection({
    super.key,
    required this.isDark,
    required this.screenWidth,
    this.imageFile,
    required this.pickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Image with Camera Button
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: RegisterHelper.getProfileImageSize(screenWidth),
              height: RegisterHelper.getProfileImageSize(screenWidth),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: RegisterHelper.getProfileImageSize(screenWidth) / 2,
                backgroundImage: imageFile != null
                    ? FileImage(File(imageFile!.path))
                    : const NetworkImage(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuBkadY9CsZDLIPFM7EayzP1XuCaJBVGylozNTSr4UETlsp7MPL2-8U-FEB9IyACZXVoY9UtD5GwduYf2k1ORPS2sOKOwb5OBaRg2ZHIAo78a39WyCMlpPugul5ilzU8LRimusc5BKpjrETmTkFGua3vPfvfLBdNV403QUmVAMj676_WG--AZo0Bp33d1Cx8uDwm2yvE7dqIfWk5ag-CjH23x3cU25SLCqkvTzOcYMOe_Ou7D9Ah-vOCfao82TajjMLNs9f0_JOFms0B',
                      ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: pickImage,
                child: Container(
                  width: RegisterHelper.getCameraButtonSize(screenWidth),
                  height: RegisterHelper.getCameraButtonSize(screenWidth),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00BFFF),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.photo_camera,
                    color: Colors.white,
                    size: RegisterHelper.getCameraIconSize(screenWidth),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: RegisterHelper.getProfileTextSpacing(screenWidth)),
        // Role Text
        Text(
          'Delivery Agent',
          style: GoogleFonts.inter(
            fontSize: RegisterHelper.getRoleFontSize(screenWidth),
            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}
