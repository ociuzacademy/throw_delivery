import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:throw_delivery/core/exports/bloc_exports.dart';
import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_delivery/modules/home_module/view/home_page.dart';
import 'package:throw_delivery/modules/login_module/utils/login_helper.dart';
import 'package:throw_delivery/modules/login_module/widgets/login_header.dart';
import 'package:throw_delivery/modules/login_module/widgets/login_content.dart';
import 'package:throw_delivery/modules/login_module/widgets/login_footer.dart';
import 'package:throw_delivery/core/widgets/responsive_container.dart';
import 'package:throw_delivery/modules/profile_review_module/view/profile_review_page.dart';
import 'package:throw_delivery/modules/vehicle_register_module/view/vehicle_register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (context) => const LoginPage());

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginHelper _loginHelper;
  @override
  void initState() {
    super.initState();
    _loginHelper = LoginHelper(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          switch (state) {
            case Authenticated(
              user: final user,
              isRegistered: final isRegistered,
              isApproved: final isApproved,
            ):
              debugPrint('User: $user');
              debugPrint('isRegistered: $isRegistered');
              debugPrint('isApproved: $isApproved');
              if (!isRegistered) {
                CustomSnackbar.showInfo(
                  context: context,
                  message: 'You still haven\'t completed your registration.',
                );
                Navigator.of(context).pushAndRemoveUntil(
                  VehicleRegisterPage.route(),
                  (route) => false,
                );
              } else {
                if (isApproved) {
                  CustomSnackbar.showSuccess(
                    context: context,
                    message: 'User authenticated successfully.',
                  );
                  Navigator.of(
                    context,
                  ).pushAndRemoveUntil(HomePage.route(), (route) => false);
                } else {
                  CustomSnackbar.showInfo(
                    context: context,
                    message: 'Your profile is under review.',
                  );
                  Navigator.of(context).pushAndRemoveUntil(
                    ProfileReviewPage.route(),
                    (route) => false,
                  );
                }
              }
              break;
            case AuthErrorState(
              message: final message,
              details: final details,
              code: _,
            ):
              debugPrint('Auth Error: $message');
              debugPrint('details: $details');
              CustomSnackbar.showError(
                context: context,
                message: details ?? 'Authentication error occurred.',
              );
              break;
            default:
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              const LoginHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24.0),
                  child: ResponsiveContainer(
                    maxWidth: 384,
                    child: LoginContent(onPressed: _loginHelper.handleLogin),
                  ),
                ),
              ),
              const LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
