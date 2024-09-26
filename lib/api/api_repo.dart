import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hong_hung_application/models/user.dart';
import 'package:hong_hung_application/storage/security_storage.dart';

class API {
  final Dio _dio = Dio();
  String baseUrl = "http://10.10.1.108:8080";

  // String baseUrl = "http://172.16.28.107:8888";
  API() {
    _dio.options.baseUrl = "$baseUrl/";
  }

  Dio get sendRequest => _dio;
}

class APIRepository {
  API api = API();

  Map<String, dynamic> header(String token) {
    return {
      "Access-Control-Allow-Origin": "*",
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };
  }

  Future<bool> login(String username, password) async {
    Map<String, dynamic> body = {
      "username": username,
      "password": password,
    };
    try {
      Response response = await api.sendRequest.post(
        "/auth/login",
        data: body,
      );
      if (response.statusCode == 200) {
        final tokenData = response.data['result']['token'];
        bool r =
            await SecurityStorage.saveToken(response.data['result']['token']);
        log("LOGIN SUCCESS WITH TOKEN:$tokenData");
        // log("BODY: ${response.data}");
        return r;
      } else {
        log("Failse");
        return false;
      }
    } catch (ex) {
      log(ex.toString());
      return false;
    }
  }

  Future<User?> getInformation() async {
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get("/users/getUserInfomation",
          options: Options(headers: header(token)));
      if (response.statusCode == 200) {
        var data = response.data['result'];
        User userInfo = User.fromJson(data);

        return userInfo;
      } else {
        return null;
      }
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }
}
