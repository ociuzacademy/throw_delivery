// register_page.dart (updated)
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:throw_delivery/core/cubit/delivery_agent_profile/delivery_agent_profile_cubit.dart';
import 'package:throw_delivery/core/widgets/loaders/overlay_loader.dart';
import 'package:throw_delivery/core/widgets/snackbars/custom_snackbar.dart';
import 'package:throw_delivery/modules/document_upload_module/view/document_upload_page.dart';
import 'package:throw_delivery/modules/vehicle_register_module/bloc/register_vehicle_bloc.dart';
import 'package:throw_delivery/modules/vehicle_register_module/providers/register_provider.dart';
import 'package:throw_delivery/modules/vehicle_register_module/utils/vehicle_register_helper.dart';
import 'package:throw_delivery/modules/vehicle_register_module/widgets/vehicle_register_body.dart';

class VehicleRegisterPage extends StatefulWidget {
  const VehicleRegisterPage({super.key});

  @override
  State<VehicleRegisterPage> createState() => _VehicleRegisterPageState();

  static MaterialPageRoute route() =>
      MaterialPageRoute(builder: (_) => const VehicleRegisterPage());
}

class _VehicleRegisterPageState extends State<VehicleRegisterPage> {
  late final VehicleRegisterHelper _vehicleRegisterHelper;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _vehicleRegisterHelper = VehicleRegisterHelper(context: context);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _vehicleRegisterHelper.deliveryAgentProfileInit();
    });
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
          title: const Text('Vehicle Details Setup'),
          titleTextStyle: GoogleFonts.inter(
            fontSize: VehicleRegisterHelper.getTitleFontSize(
              MediaQuery.of(context).size.width,
            ),
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        body: Consumer<RegisterProvider>(
          builder: (context, provider, child) {
            return MultiBlocListener(
              listeners: [
                BlocListener<
                  DeliveryAgentProfileCubit,
                  DeliveryAgentProfileState
                >(
                  listener: (context, state) {
                    switch (state) {
                      case DeliveryAgentProfileLoading():
                        OverlayLoader.show(
                          context,
                          message: 'User profile loading...',
                        );
                        break;
                      case DeliveryAgentProfileSuccess(:final deliveryAgent):
                        OverlayLoader.hide();
                        provider.userDetailsInitFromApi(deliveryAgent);
                        break;
                      case DeliveryAgentProfileError(:final message):
                        OverlayLoader.hide();
                        CustomSnackbar.showError(
                          context: context,
                          message: message,
                        );
                        break;
                      default:
                        break;
                    }
                  },
                ),
                BlocListener<RegisterVehicleBloc, RegisterVehicleState>(
                  listener: (context, state) {
                    switch (state) {
                      case RegisterVehicleLoading():
                        OverlayLoader.show(
                          context,
                          message: 'Registering vehicle...',
                        );
                        break;
                      case RegisterVehicleSuccess():
                        OverlayLoader.hide();
                        CustomSnackbar.showSuccess(
                          context: context,
                          message: 'Vehicle registered successfully!',
                        );
                        Navigator.of(context).pushAndRemoveUntil(
                          DocumentUploadPage.route(),
                          (route) => false,
                        );
                        break;
                      case RegisterVehicleError(:final message):
                        OverlayLoader.hide();
                        CustomSnackbar.showError(
                          context: context,
                          message: message,
                        );
                        break;
                      default:
                        break;
                    }
                  },
                ),
              ],
              child: VehicleRegisterBody(
                formKey: _formKey,
                provider: provider,
                onVehicleRegister: () {
                  _vehicleRegisterHelper.registerVehicle(_formKey, provider);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
