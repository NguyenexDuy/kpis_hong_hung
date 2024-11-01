import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hong_hung_application/api/api.dart';
import 'package:hong_hung_application/models/models/user.dart';
import 'package:hong_hung_application/storage/security_storage.dart';

class APIRepository {
  API api = API();
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

  Future<User> getInformation() async {
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get("/users/getUserInfomation",
          options: Options(headers: header(token)));

      var data = response.data['result'];
      User userInfo = User.fromJson(data);

      return userInfo;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  Future<void> getInformationn() async {
    log("thuc hien getinfo new");
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get("/users/getUserInfomation",
          options: Options(headers: header(token)));

      var data = response.data['result'];
      User userInfo = User.fromJson(data);

      String jsonUser = jsonEncode(userInfo);
      log("da lay thanh cong voi jsonUser: $jsonUser");
      bool result = await SecurityStorage.saveUserInformation(jsonUser);
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }
}
