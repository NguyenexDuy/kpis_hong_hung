import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecurityStorage {
  static AndroidOptions _getOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  static final storage = FlutterSecureStorage(aOptions: _getOptions());
  static clearToken() async {
    await storage.delete(key: "token");
  }

  static Future<bool> saveToken(String token) async {
    try {
      await storage.write(key: "token", value: token);
    } catch (ex) {
      return false;
    }
    return true;
  }

  static Future<bool> saveUserInformation(String user) async {
    try {
      await storage.write(key: "user", value: user);
    } catch (ex) {
      return false;
    }
    return true;
  }

  static Future<String> getToken() async {
    String? token = await storage.read(key: "token");
    return token ?? "";
  }
}
