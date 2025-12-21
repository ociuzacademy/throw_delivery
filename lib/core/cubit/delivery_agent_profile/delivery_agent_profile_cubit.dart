import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_delivery/core/models/delivery_agent_model.dart';
import 'package:throw_delivery/core/repository/delivery_agent_repository.dart';
import 'package:throw_delivery/core/storage/auth_storage_functions.dart';

part 'delivery_agent_profile_state.dart';
part 'delivery_agent_profile_cubit.freezed.dart';

class DeliveryAgentProfileCubit extends Cubit<DeliveryAgentProfileState> {
  DeliveryAgentProfileCubit()
    : super(const DeliveryAgentProfileState.initial());

  Future<void> getDeliveryAgentProfile() async {
    emit(const DeliveryAgentProfileState.loading());
    try {
      final String? uid = await AuthStorageFunctions().getUid();
      if (uid == null) {
        emit(const DeliveryAgentProfileState.error('UID not found'));
        return;
      }
      final deliveryAgent = await DeliveryAgentRepository()
          .getDeliveryAgentByUid(uid);
      if (deliveryAgent == null) {
        emit(const DeliveryAgentProfileState.error('Delivery agent not found'));
        return;
      }
      emit(DeliveryAgentProfileState.success(deliveryAgent));
    } catch (e) {
      emit(DeliveryAgentProfileState.error(e.toString()));
    }
  }
}
