// register_page.dart (updated)
// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/vehicle_register_module/providers/register_provider.dart';
import 'package:throw_delivery/modules/vehicle_register_module/utils/vehicle_register_helper.dart';
import 'package:throw_delivery/modules/vehicle_register_module/widgets/contact_information_section.dart';
import 'package:throw_delivery/modules/vehicle_register_module/widgets/profile_section.dart';

class VehicleRegisterBody extends StatelessWidget {
  const VehicleRegisterBody({
    super.key,
    required this.formKey,
    required this.provider,
  });

  final GlobalKey<FormState> formKey;
  final RegisterProvider provider;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(
                VehicleRegisterHelper.getContentPadding(screenWidth),
              ),
              child: Container(
                width: double.infinity,
                constraints: BoxConstraints(
                  maxWidth: VehicleRegisterHelper.getMaxContainerWidth(
                    screenWidth,
                  ),
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // Profile Section
                      ProfileSection(
                        isDark: isDark,
                        screenWidth: screenWidth,
                        imageUrl: provider.profileImage!,
                      ),
                      SizedBox(
                        height: VehicleRegisterHelper.getSectionSpacing(
                          screenWidth,
                        ),
                      ),

                      // Contact Information Section
                      ContactInformationSection(
                        isDark: isDark,
                        screenWidth: screenWidth,
                        nameController: provider.nameController,
                        emailController: provider.emailController,
                        phoneController: provider.phoneController,
                        vehicleTypeController: provider.vehicleTypeController,
                        vehicleModelController: provider.vehicleModelController,
                        licensePlateController: provider.licensePlateController,
                        vehicleTypeFocusNode: provider.vehicleTypeFocusNode,
                        vehicleModelFocusNode: provider.vehicleModelFocusNode,
                        licensePlateFocusNode: provider.licensePlateFocusNode,
                        register: () {},
                      ),

                      // Add extra space at the bottom for keyboard
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom > 0
                            ? 80
                            : 0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Footer Button - Only show when keyboard is not visible
          if (MediaQuery.of(context).viewInsets.bottom == 0)
            Container(
              padding: EdgeInsets.all(
                VehicleRegisterHelper.getFooterPadding(screenWidth),
              ),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF0f172a) : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00BFFF),
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: VehicleRegisterHelper.getButtonPadding(
                        screenWidth,
                      ),
                      horizontal: 24,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        VehicleRegisterHelper.getBorderRadius(screenWidth),
                      ),
                    ),
                    elevation: 8,
                    shadowColor: const Color(0xFF00BFFF).withValues(alpha: 0.3),
                  ),
                  child: Text(
                    'Register',
                    style: GoogleFonts.inter(
                      fontSize: VehicleRegisterHelper.getButtonFontSize(
                        screenWidth,
                      ),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
