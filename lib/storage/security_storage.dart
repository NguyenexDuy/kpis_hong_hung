import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hong_hung_application/models/models/user.dart';

class SecurityStorage {
  static AndroidOptions _getOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);
  static final storage = FlutterSecureStorage(aOptions: _getOptions());

  static clearToken() async {
    log("thuc hien xoa token hien tai");
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
    log("thuc hien storage save inforuser");
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

  static Future<User> getUser() async {
    String? jsonString = await storage.read(key: "user");

    Map<String, dynamic> jsonData = jsonDecode(jsonString!);
    return User.fromJson(jsonData);
  }
}
