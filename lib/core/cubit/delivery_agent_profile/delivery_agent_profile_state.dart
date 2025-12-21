part of 'delivery_agent_profile_cubit.dart';

@freezed
sealed class DeliveryAgentProfileState with _$DeliveryAgentProfileState {
  const factory DeliveryAgentProfileState.initial() =
      DeliveryAgentProfileInitial;
  const factory DeliveryAgentProfileState.loading() =
      DeliveryAgentProfileLoading;
  const factory DeliveryAgentProfileState.success(
    DeliveryAgentModel deliveryAgent,
  ) = DeliveryAgentProfileSuccess;
  const factory DeliveryAgentProfileState.error(String message) =
      DeliveryAgentProfileError;
}
