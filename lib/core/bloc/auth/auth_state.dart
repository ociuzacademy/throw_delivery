part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authenticated({
    required UserProfile user,
    required bool hasVehicleRegistered,
    required bool hasApproved,
    required bool hasDocumentUploaded,
  }) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.error({
    required String message,
    String? details,
    String? code,
  }) = AuthError;
}
