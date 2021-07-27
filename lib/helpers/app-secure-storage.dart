import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static final _storage = new FlutterSecureStorage();

  static writeValue(String key, dynamic value) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> readValue(String key) async {
    return await _storage.read(key: key);
  }

  static readAll() async {
    return await _storage.readAll();
  }

  static deleteKey(String key) async {
    await _storage.delete(key: key);
  }

  static deleteAll() async {
    await _storage.deleteAll();
  }
}
