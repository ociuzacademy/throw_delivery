import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_delivery/core/repository/delivery_agent_repository.dart';
import 'package:throw_delivery/core/storage/auth_storage_functions.dart';
import 'package:throw_delivery/modules/vehicle_register_module/classes/vehicle_data.dart';

part 'register_vehicle_event.dart';
part 'register_vehicle_state.dart';
part 'register_vehicle_bloc.freezed.dart';

class RegisterVehicleBloc
    extends Bloc<RegisterVehicleEvent, RegisterVehicleState> {
  final DeliveryAgentRepository _deliveryAgentRepository;
  RegisterVehicleBloc({
    required DeliveryAgentRepository deliveryAgentRepository,
  }) : _deliveryAgentRepository = deliveryAgentRepository,
       super(const RegisterVehicleInitial()) {
    on<_RegisterVehicle>(_onRegisterVehicle);
  }

  Future<void> _onRegisterVehicle(
    _RegisterVehicle event,
    Emitter<RegisterVehicleState> emit,
  ) async {
    emit(const RegisterVehicleLoading());
    try {
      final String? uid = await AuthStorageFunctions().getUid();
      if (uid == null) {
        emit(const RegisterVehicleError('User not signed in'));
        return;
      }
      await _deliveryAgentRepository.addVehicleDetails(uid, event.vehicleData);
      emit(const RegisterVehicleSuccess());
    } catch (e) {
      emit(RegisterVehicleError(e.toString()));
    }
  }
}
