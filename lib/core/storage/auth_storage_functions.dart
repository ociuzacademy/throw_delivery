import 'package:throw_delivery/core/exceptions/storage_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:throw_delivery/core/models/auth_response.dart';
import 'package:throw_delivery/core/storage/auth_storage_keys.dart';

class AuthStorageFunctions {
  Future<void> saveUid(AuthResponse authResponse) async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Handle different AuthResponse types
      await authResponse.when(
        success: (user, token) async {
          // Save only the uid
          await prefs.setString(AuthStorageKeys.uid, user.uid);
        },
        error: (code, message, details) {
          // Don't save error responses
          return;
        },
        cancelled: () {
          // Don't save cancelled responses
          return;
        },
      );
    } catch (e) {
      throw StorageException(
        message: 'Failed to save UID to storage',
        details: e.toString(),
      );
    }
  }

  Future<String?> getUid() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(AuthStorageKeys.uid);
    } catch (e) {
      throw StorageException(
        message: 'Failed to retrieve UID from storage',
        details: e.toString(),
      );
    }
  }

  Future<void> clear() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(AuthStorageKeys.uid);
    } catch (e) {
      throw StorageException(
        message: 'Failed to clear auth storage',
        details: e.toString(),
      );
    }
  }
}
