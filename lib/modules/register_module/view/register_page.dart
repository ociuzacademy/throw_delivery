// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:throw_delivery/modules/register_module/utils/register_helper.dart';
import 'package:throw_delivery/modules/register_module/widgets/contact_information_section.dart';
import 'package:throw_delivery/modules/register_module/widgets/profile_section.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  static route() => MaterialPageRoute(builder: (_) => RegisterPage());
}

class _RegisterPageState extends State<RegisterPage> {
  late final RegisterHelper _registerHelper;
  final ValueNotifier<File?> _profileImage = ValueNotifier<File?>(null);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _vehicleTypeController = TextEditingController();
  final TextEditingController _vehicleModelController = TextEditingController();
  final TextEditingController _licensePlateController = TextEditingController();

  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _vehicleTypeFocusNode = FocusNode();
  final FocusNode _vehicleModelFocusNode = FocusNode();
  final FocusNode _licensePlateFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _registerHelper = RegisterHelper(
      context: context,
      profileImage: _profileImage,
      formKey: _formKey,
      nameController: _nameController,
      emailController: _emailController,
      phoneController: _phoneController,
      passwordController: _passwordController,
      vehicleTypeController: _vehicleTypeController,
      vehicleModelController: _vehicleModelController,
      licensePlateController: _licensePlateController,
    );
  }

  @override
  void dispose() {
    _profileImage.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _vehicleTypeController.dispose();
    _vehicleModelController.dispose();
    _licensePlateController.dispose();
    _nameFocusNode.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _vehicleTypeFocusNode.dispose();
    _vehicleModelFocusNode.dispose();
    _licensePlateFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF0f172a) : Colors.white,
      appBar: AppBar(
        title: Text('Profile Setup'),
        titleTextStyle: GoogleFonts.inter(
          fontSize: RegisterHelper.getTitleFontSize(screenWidth),
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        // Add SafeArea to prevent overlap with system UI
        bottom: false, // Set bottom to false to handle keyboard manually
        child: Column(
          children: [
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.all(
                  RegisterHelper.getContentPadding(screenWidth),
                ),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: RegisterHelper.getMaxContainerWidth(screenWidth),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Profile Section
                        ValueListenableBuilder(
                          valueListenable: _profileImage,
                          builder: (context, imageFile, child) {
                            return ProfileSection(
                              isDark: isDark,
                              screenWidth: screenWidth,
                              pickImage: _registerHelper.pickImage,
                              imageFile: imageFile,
                            );
                          },
                        ),
                        SizedBox(
                          height: RegisterHelper.getSectionSpacing(screenWidth),
                        ),

                        // Contact Information Section
                        ContactInformationSection(
                          isDark: isDark,
                          screenWidth: screenWidth,
                          nameController: _nameController,
                          emailController: _emailController,
                          phoneController: _phoneController,
                          passwordController: _passwordController,
                          vehicleTypeController: _vehicleTypeController,
                          vehicleModelController: _vehicleModelController,
                          licensePlateController: _licensePlateController,
                          nameFocusNode: _nameFocusNode,
                          emailFocusNode: _emailFocusNode,
                          phoneFocusNode: _phoneFocusNode,
                          passwordFocusNode: _passwordFocusNode,
                          vehicleTypeFocusNode: _vehicleTypeFocusNode,
                          vehicleModelFocusNode: _vehicleModelFocusNode,
                          licensePlateFocusNode: _licensePlateFocusNode,
                          register: _registerHelper.register,
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
                  RegisterHelper.getFooterPadding(screenWidth),
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
                    onPressed: _registerHelper.register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00BFFF),
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: RegisterHelper.getButtonPadding(screenWidth),
                        horizontal: 24,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          RegisterHelper.getBorderRadius(screenWidth),
                        ),
                      ),
                      elevation: 8,
                      shadowColor: const Color(
                        0xFF00BFFF,
                      ).withValues(alpha: 0.3),
                    ),
                    child: Text(
                      'Register',
                      style: GoogleFonts.inter(
                        fontSize: RegisterHelper.getButtonFontSize(screenWidth),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
