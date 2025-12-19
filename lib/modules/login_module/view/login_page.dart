import 'package:flutter/material.dart';
import '../widgets/login_header.dart';
import '../widgets/login_content.dart';
import '../widgets/login_footer.dart';
import '../../../core/widgets/responsive_container.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static MaterialPageRoute route() => MaterialPageRoute(
        builder: (context) => const LoginPage(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            const LoginHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: ResponsiveContainer(
                  maxWidth: 384,
                  child: const LoginContent(),
                ),
              ),
            ),
            const LoginFooter(),
          ],
        ),
      ),
    );
  }
}
