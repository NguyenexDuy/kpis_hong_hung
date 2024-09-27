import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hong_hung_application/api/api.dart';
import 'package:hong_hung_application/models/result/rs_member_as_manager.dart';
import 'package:hong_hung_application/storage/security_storage.dart';

class ManagerRepo {
  API api = API();
  //kết quả đánh giá cấp quản lý

  Future<List<RsMemberAsManager>> getResultMemberAssessManager(
      int month, int year) async {
    log("Dang thuc hien lay ket qua tu danh gia");
    List<RsMemberAsManager> mlist = [];
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
        "/manager/getResultMemberAssessManager",
        queryParameters: {
          "month": month,
          "year": year,
        },
        options: Options(headers: header(token)),
      );
      var data = response.data['result'];
      if (data is List) {
        mlist = data.map((e) => RsMemberAsManager.fromJson(e)).toList();
      }
      return mlist;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }
}
