import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hong_hung_application/api/api.dart';
import 'package:hong_hung_application/models/result/rs_manager_as_yourself.dart';
import 'package:hong_hung_application/models/result/rs_member_assess.dart';
import 'package:hong_hung_application/models/result/rs_selt_assessment_dyary.dart';
import 'package:hong_hung_application/storage/security_storage.dart';

class GetSelfAsStaffRepo {
  API api = API();

//kết quả tự đánh giá
  Future<List<ResultSeltAssessmentDyary_MD>> getSelfAsStaff() async {
    log("Dang thuc hien lay ket qua tu danh gia");
    String token = await SecurityStorage.getToken();
    List<ResultSeltAssessmentDyary_MD> mList = [];

    try {
      Response response = await api.sendRequest.get("/staff/getSeflAssessStaff",
          options: Options(headers: header(token)));

      if (response.statusCode == 200) {
        var data = response.data["result"];
        if (data is List) {
          // Kiểm tra kiểu dữ liệu
          mList = data
              .map((e) => ResultSeltAssessmentDyary_MD.fromJson(e))
              .toList();
        }
        log("da lay xong");
      }
      return mList;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

//kết quả đánh giá cấp nhân viên
  Future<List<RsMemberAssess>> getMemberAssess(int month, int year) async {
    log("dang thuc hien lay ket qua danh gia cap nhan vien");
    String token = await SecurityStorage.getToken();
    List<RsMemberAssess> mlist = [];
    try {
      Response response = await api.sendRequest.get(
          "/staff/getResultMemberAssess",
          options: Options(headers: header(token)),
          queryParameters: {
            'month': month,
            'year': year,
          });
      var data = response.data['result'];
      // print("day la body:$data");
      if (data is List) {
        mlist = data.map((e) => RsMemberAssess.fromJson(e)).toList();
      }
      return mlist;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

//xem cấp trên đánh giá
  Future<List<RsManagerAsYourself>> getResultManagerAsYourself() async {
    log("dang thuc hien lay ket qua xem cap tren danh gia");
    String token = await SecurityStorage.getToken();
    List<RsManagerAsYourself> mlist = [];
    try {
      Response response = await api.sendRequest.get(
        "staff/getManagerAssessYourSelf",
        options: Options(headers: header(token)),
      );
      var data = response.data['result'];
      print("day la body:$data");
      if (data is List) {
        mlist = data.map((e) => RsManagerAsYourself.fromJson(e)).toList();
      }
      return mlist;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }
}
