// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:throw_delivery/modules/vehicle_register_module/utils/vehicle_register_helper.dart';

class ProfileSection extends StatelessWidget {
  final bool isDark;
  final double screenWidth;
  final String? imageUrl;
  const ProfileSection({
    super.key,
    required this.isDark,
    required this.screenWidth,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Image with Camera Button
        Container(
          width: VehicleRegisterHelper.getProfileImageSize(screenWidth),
          height: VehicleRegisterHelper.getProfileImageSize(screenWidth),
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
            radius: VehicleRegisterHelper.getProfileImageSize(screenWidth) / 2,
            backgroundImage: imageUrl != null
                ? CachedNetworkImageProvider(imageUrl!)
                : const CachedNetworkImageProvider(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBkadY9CsZDLIPFM7EayzP1XuCaJBVGylozNTSr4UETlsp7MPL2-8U-FEB9IyACZXVoY9UtD5GwduYf2k1ORPS2sOKOwb5OBaRg2ZHIAo78a39WyCMlpPugul5ilzU8LRimusc5BKpjrETmTkFGua3vPfvfLBdNV403QUmVAMj676_WG--AZo0Bp33d1Cx8uDwm2yvE7dqIfWk5ag-CjH23x3cU25SLCqkvTzOcYMOe_Ou7D9Ah-vOCfao82TajjMLNs9f0_JOFms0B',
                  ),
          ),
        ),
        SizedBox(
          height: VehicleRegisterHelper.getProfileTextSpacing(screenWidth),
        ),
        // Role Text
        Text(
          'Delivery Agent',
          style: GoogleFonts.inter(
            fontSize: VehicleRegisterHelper.getRoleFontSize(screenWidth),
            color: isDark ? const Color(0xFF9CA3AF) : const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}
