// register_page.dart (updated)
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:throw_delivery/modules/register_module/providers/register_provider.dart';
import 'package:throw_delivery/modules/register_module/services/register_service.dart';
import 'package:throw_delivery/modules/register_module/utils/register_helper.dart';
import 'package:throw_delivery/modules/register_module/widgets/register_body.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => RegisterPage());
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late RegisterService _registerService;

  @override
  void initState() {
    super.initState();
    _registerService = RegisterService(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(),
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF0f172a)
            : Colors.white,
        appBar: AppBar(
          title: Text('Profile Setup'),
          titleTextStyle: GoogleFonts.inter(
            fontSize: RegisterHelper.getTitleFontSize(
              MediaQuery.of(context).size.width,
            ),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        body: Consumer<RegisterProvider>(
          builder: (context, provider, child) {
            return RegisterBody(
              formKey: _formKey,
              registerService: _registerService,
              context: context,
              provider: provider,
            );
          },
        ),
      ),
    );
  }
}
