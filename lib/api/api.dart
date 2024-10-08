import 'package:dio/dio.dart';

class API {
  final Dio _dio = Dio();
  String baseUrl = "http://10.10.1.106:8080";
  API() {
    _dio.options.baseUrl = "$baseUrl/";
  }

  Dio get sendRequest => _dio;
}

Map<String, dynamic> header(String token) {
  return {
    "Access-Control-Allow-Origin": "*",
    'Content-Type': 'application/json',
    'Accept': '*/*',
    'Authorization': 'Bearer $token'
  };
}
