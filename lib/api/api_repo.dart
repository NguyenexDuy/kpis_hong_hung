import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hong_hung_application/models/user.dart';
import 'package:hong_hung_application/storage/security_storage.dart';

class API {
  final Dio _dio = Dio();
  String baseUrl = "http://10.10.1.103:8080";

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
        log("BODY: ${response.data}");
        return true;
      } else {
        log("Failse");
        return false;
      }
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  Future<String> getInformation() async {
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get("/users/getUserInfomation",
          options: Options(headers: header(token)));
      if (response.statusCode == 200) {
        bool saveUser = await SecurityStorage.saveUserInformation(
            jsonEncode(response.data['result']));

        return "Success when get infomation";
      } else {
        return "Failed when get infomation";
      }
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }
}
