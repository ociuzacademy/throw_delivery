part of 'register_vehicle_bloc.dart';

@freezed
sealed class RegisterVehicleState with _$RegisterVehicleState {
  const factory RegisterVehicleState.initial() = RegisterVehicleInitial;
  const factory RegisterVehicleState.loading() = RegisterVehicleLoading;
  const factory RegisterVehicleState.success() = RegisterVehicleSuccess;
  const factory RegisterVehicleState.error(String message) =
      RegisterVehicleError;
}
