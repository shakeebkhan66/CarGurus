import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final storage = const FlutterSecureStorage();

  Future<String?> read({required String key}) async {
    try {
      String? value = await storage.read(key: key);
      return value;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> write({required String key, String? value}) async {
    try {
      await storage.write(key: key, value: value);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> delete({required String key}) async {
    try {
      await storage.delete(key: key);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, String>> readAll() async {
    try {
      Map<String, String> allValues = await storage.readAll();
      return allValues;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteAll() async {
    try {
      await storage.deleteAll();
    } catch (e) {
      rethrow;
    }
  }
}
