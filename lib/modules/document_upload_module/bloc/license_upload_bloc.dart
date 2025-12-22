import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:throw_delivery/core/repository/delivery_agent_repository.dart';
import 'package:throw_delivery/core/storage/auth_storage_functions.dart';

part 'license_upload_event.dart';
part 'license_upload_state.dart';
part 'license_upload_bloc.freezed.dart';

class LicenseUploadBloc extends Bloc<LicenseUploadEvent, LicenseUploadState> {
  final DeliveryAgentRepository _deliveryAgentRepository;
  LicenseUploadBloc({required DeliveryAgentRepository deliveryAgentRepository})
    : _deliveryAgentRepository = deliveryAgentRepository,
      super(const LicenseUploadInitial()) {
    on<_UploadLicense>(_onUploadLicenseImage);
    on<_ResetDocumentUpload>(_onReset);
  }

  Future<void> _onUploadLicenseImage(
    _UploadLicense event,
    Emitter<LicenseUploadState> emit,
  ) async {
    emit(const LicenseUploadState.loading());
    try {
      final uid = await AuthStorageFunctions().getUid();
      if (uid == null) {
        emit(const LicenseUploadState.error('User not authenticated'));
        return;
      }

      await _deliveryAgentRepository.uploadLicenseImage(
        uid: uid,
        imagePath: event.image.path,
      );

      emit(const LicenseUploadState.success());
    } catch (e) {
      emit(LicenseUploadState.error('Upload failed: $e'));
    }
  }

  Future<void> _onReset(
    _ResetDocumentUpload event,
    Emitter<LicenseUploadState> emit,
  ) async {
    emit(const LicenseUploadInitial());
  }
}
