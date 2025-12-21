part of 'register_vehicle_bloc.dart';

@freezed
sealed class RegisterVehicleEvent with _$RegisterVehicleEvent {
  const factory RegisterVehicleEvent.started() = _Started;
  const factory RegisterVehicleEvent.registerVehicle(VehicleData vehicleData) =
      _RegisterVehicle;
}
