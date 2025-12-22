part of 'license_upload_bloc.dart';

@freezed
sealed class LicenseUploadEvent with _$LicenseUploadEvent {
  const factory LicenseUploadEvent.started() = _Started;
  const factory LicenseUploadEvent.uploadLicense({required File image}) =
      _UploadLicense;
  const factory LicenseUploadEvent.reset() = _ResetDocumentUpload;
}
