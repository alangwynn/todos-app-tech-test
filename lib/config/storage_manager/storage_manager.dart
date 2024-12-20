import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageManager {
  SecureStorageManager._internal(FlutterSecureStorage secureStorage) {
    _secureStorage = secureStorage;
  }

  /// Singleton
  static SecureStorageManager? _instance;

  static SecureStorageManager get instance {
    if (_instance == null) {
      throw Exception('SecureStorageManager is not initialized, '
          'use SecureStorageManagerRepository.initialize() first');
    }
    return _instance!;
  }

  late FlutterSecureStorage _secureStorage;

  /// Initialize the singleton with the provided instance
  static Future<void> initialize() async {
    if (_instance != null) {
      return;
    }
    _instance = SecureStorageManager._internal(const FlutterSecureStorage());
  }

  static bool get isInitialized => _instance != null;

  /// Set a value for a key.
  Future<void> setString({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  /// Get a value for a key.
  Future<String?> getString({required String key}) {
    return _secureStorage.read(key: key);
  }

  /// Clear all values.
  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }

  /// Delete a value for a key.
  Future<void> delete({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  /// Check if a key exists.
  Future<bool> containsKey({required String key}) {
    return _secureStorage.containsKey(key: key);
  }
}
