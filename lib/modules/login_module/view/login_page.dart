import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:throw_delivery/modules/login_module/utils/login_helper.dart';
import 'package:throw_delivery/core/widgets/text_field/custom_text_field.dart';
import 'package:throw_delivery/modules/register_module/view/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

  static MaterialPageRoute route() => MaterialPageRoute(builder: (_) => LoginPage());
}

class _LoginPageState extends State<LoginPage> {
  late final LoginHelper _loginHelper;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier(false);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loginHelper = LoginHelper(
      context: context,
      emailController: _emailController,
      passwordController: _passwordController,
      formKey: _formKey,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _isPasswordVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;

    return Scaffold(
      backgroundColor: isDark
          ? const Color(0xFF0f1c23)
          : const Color(0xFFf5f7f8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Login',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : const Color(0xFF111827),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Main Content - Using Flexible instead of Expanded for better control
            Flexible(
              flex: 5,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(_getContentPadding(screenWidth)),
                child: Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: _getMaxContainerWidth(screenWidth),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: _getWelcomeSpacing(screenHeight)),

                        // Welcome Section
                        Text(
                          'Welcome Back',
                          style: GoogleFonts.inter(
                            fontSize: _getWelcomeTitleFontSize(screenWidth),
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF00aaff),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: _getWelcomeSubtitleSpacing(screenWidth),
                        ),
                        Text(
                          'Sign in to continue your deliveries',
                          style: GoogleFonts.inter(
                            fontSize: _getWelcomeSubtitleFontSize(screenWidth),
                            color: isDark
                                ? const Color(0xFF9CA3AF)
                                : const Color(0xFF6B7280),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: _getFormSpacing(screenHeight)),

                        // Form Fields
                        Column(
                          children: [
                            // Email Field
                            CustomTextField(
                              controller: _emailController,
                              focusNode: _emailFocusNode,
                              hintText: 'Email or Phone',
                              isDark: isDark,
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email or phone';
                                }
                                // Email validation
                                if (value.contains('@')) {
                                  if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                  ).hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                }
                                // Phone validation (basic)
                                else {
                                  if (value.length < 10) {
                                    return 'Please enter a valid phone number';
                                  }
                                }
                                return null;
                              },
                              onFieldSubmitted: (_) {
                                _passwordFocusNode.requestFocus();
                              },
                            ),

                            SizedBox(height: _getFieldSpacing(screenHeight)),

                            // Password Field
                            ValueListenableBuilder<bool>(
                              valueListenable: _isPasswordVisible,
                              builder: (context, isPasswordVisible, _) {
                                return CustomTextField(
                                  controller: _passwordController,
                                  focusNode: _passwordFocusNode,
                                  hintText: 'Password',
                                  isDark: isDark,
                                  obscureText: !isPasswordVisible,
                                  textInputAction: TextInputAction.done,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _isPasswordVisible.value =
                                          !_isPasswordVisible.value;
                                    },
                                    icon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: const Color(0xFF9CA3AF),
                                    ),
                                  ),
                                  onFieldSubmitted: (_) {
                                    _loginHelper.handleLogin();
                                  },
                                );
                              },
                            ),

                            SizedBox(
                              height: _getForgotPasswordSpacing(screenHeight),
                            ),

                            // Forgot Password
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: () {
                                  // Handle forgot password
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: GoogleFonts.inter(
                                    fontSize: _getFooterFontSize(screenWidth),
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF00aaff),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: _getButtonSpacing(screenHeight)),

                            // Login Button
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: _loginHelper.handleLogin,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF00aaff),
                                  foregroundColor: Colors.white,
                                  padding: EdgeInsets.symmetric(
                                    vertical: _getButtonPadding(screenHeight),
                                    horizontal: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      _getBorderRadius(screenWidth),
                                    ),
                                  ),
                                  elevation: 8,
                                  shadowColor: const Color(
                                    0xFF00aaff,
                                  ).withValues(alpha: 0.3),
                                ),
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.inter(
                                    fontSize: _getButtonFontSize(screenWidth),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Footer - Using Flexible with smaller flex value
          ],
        ),
      ),
      persistentFooterButtons: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: _getFooterPadding(screenWidth),
          ),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF0f1c23) : const Color(0xFFf5f7f8),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, RegisterPage.route());
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Don't have an account? ",
                style: GoogleFonts.inter(
                  fontSize: _getFooterFontSize(screenWidth),
                  color: isDark
                      ? const Color(0xFF9CA3AF)
                      : const Color(0xFF6B7280),
                ),
                children: [
                  TextSpan(
                    text: 'Sign Up',
                    style: GoogleFonts.inter(
                      fontSize: _getFooterFontSize(screenWidth),
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF00aaff),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      persistentFooterAlignment: AlignmentDirectional.center,
    );
  }

  // Simplified responsive helper methods - using fixed values for now
  double _getContentPadding(double screenWidth) {
    return 24.0;
  }

  double _getMaxContainerWidth(double screenWidth) {
    return 400.0;
  }

  double _getWelcomeSpacing(double screenHeight) {
    return 40.0;
  }

  double _getWelcomeTitleFontSize(double screenWidth) {
    return 28.0;
  }

  double _getWelcomeSubtitleSpacing(double screenWidth) {
    return 8.0;
  }

  double _getWelcomeSubtitleFontSize(double screenWidth) {
    return 16.0;
  }

  double _getFormSpacing(double screenHeight) {
    return 48.0;
  }

  double _getFieldSpacing(double screenHeight) {
    return 24.0;
  }

  double _getForgotPasswordSpacing(double screenHeight) {
    return 16.0;
  }

  double _getButtonSpacing(double screenHeight) {
    return 24.0;
  }

  double _getButtonPadding(double screenHeight) {
    return 16.0;
  }

  double _getBorderRadius(double screenWidth) {
    return 12.0;
  }

  double _getButtonFontSize(double screenWidth) {
    return 16.0;
  }

  double _getFooterPadding(double screenWidth) {
    return 24.0;
  }

  double _getFooterFontSize(double screenWidth) {
    return 14.0;
  }
}
