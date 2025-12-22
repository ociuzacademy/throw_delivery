part of 'license_upload_bloc.dart';

@freezed
sealed class LicenseUploadState with _$LicenseUploadState {
  const factory LicenseUploadState.initial() = LicenseUploadInitial;
  const factory LicenseUploadState.loading() = LicenseUploadLoading;
  const factory LicenseUploadState.success() = LicenseUploadSuccess;
  const factory LicenseUploadState.error(String message) = LicenseUploadError;
}
