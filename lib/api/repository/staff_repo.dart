import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hong_hung_application/api/api.dart';
import 'package:hong_hung_application/const.dart';
import 'package:hong_hung_application/models/models/staff_list.dart';
import 'package:hong_hung_application/models/models/user.dart';
import 'package:hong_hung_application/models/result/rs_manager_as_yourself.dart';
import 'package:hong_hung_application/models/result/rs_member_assess.dart';
import 'package:hong_hung_application/models/result/rs_personal_kpi.dart';
import 'package:hong_hung_application/models/result/rs_selt_assessment_dyary.dart';
import 'package:hong_hung_application/storage/security_storage.dart';

class StaffRepo {
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

  // Future<User> getInfomation() async {
  //   log("dang thuc hien lay infomation user");
  //   String token = await SecurityStorage.getToken();
  //   User user;
  //   try {
  //     Response response = await api.sendRequest.get("users/getUserInfomation",
  //         options: Options(headers: header(token)));
  //     var userItem = response.data['result'];
  //     user = User.fromJson(userItem);
  //     return user;
  //   } catch (ex) {
  //     log(ex.toString());
  //     rethrow;
  //   }
  // }

  //get staff by Username
  Future<StaffList> getStaffbyUsername(String userName) async {
    log("thuc hien get staff by usernaem");
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
          "/staff/getStaffByUserName/$userName",
          options: Options(headers: header(token)));
      var data = response.data["result"];
      // log(jsonEncode(data));
      StaffList staffList = StaffList.fromJson(data);
      return staffList;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

//tự đánh giá bản thân(User)
  Future<bool> SeflAsStaff(
      String staffCode,
      String fullName,
      String rank,
      String groupRank,
      String roomName,
      String roomSymbol,
      String createdBy,
      int month,
      int year,
      int kyluatLD,
      int chatluongTHCM,
      int mdHTvaPT,
      int mucdoPhoiHop,
      String note) async {
    log("thuc hien tu danh gia");
    String token = await SecurityStorage.getToken();
    Map<String, dynamic> body = {
      "staff_code": staffCode,
      "name": fullName,
      "rank": rank,
      "group_rank": groupRank,
      "room_name": roomName,
      "room_symbol": roomSymbol,
      "month": month,
      "created_by": createdBy,
      "year": year,
      "ky_luat_va_thuong": kyluatLD,
      "muc_do_phoi_hop": mucdoPhoiHop,
      "chat_luong_chuyen_mon": chatluongTHCM,
      "diem_muc_do_hoc_tap_pt": mdHTvaPT,
      "note": note,
    };
    try {
      Response response = await api.sendRequest.post(
          "/staff/saveSelfAssessStaff",
          options: Options(headers: header(token)),
          data: body);
      var data = response.data["code"];
      if (data == 1000) {
        log("tu danh gia successed");
        return true;
      } else {
        log("tu danh gia failed");
        return false;
      }
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

//kết quả KPI cá nhân
  Future<List<RsPersonalKpi>> getResultPersonalKPI(int month, int year) async {
    log("Dang thuc hien lay ket qua KPI ca nhan");
    String token = await SecurityStorage.getToken();
    List<RsPersonalKpi> mlist = [];
    try {
      Response response = await api.sendRequest.get(
          "/staff/getResultPersonalKPI",
          options: Options(headers: header(token)),
          queryParameters: {
            'month': month,
            'year': year,
          });

      if (response.statusCode == 200) {
        var data = response.data["result"];
        // log("Du lieu tra ve: $data");
        if (data is List) {
          // Kiểm tra kiểu dữ liệu
          mlist = data.map((e) => RsPersonalKpi.fromJson(e)).toList();
        }
        log("da lay xong");
      }
      return mlist;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //Kết quả nhân viên tự đánh giá
  Future<List<ResultSeltAssessmentDyary_MD>> getResultSelfAssessStaff(
      int month, int year) async {
    log("Dang thuc hien lay ket qua nhan vien tu danh gia");
    String token = await SecurityStorage.getToken();
    List<ResultSeltAssessmentDyary_MD> mList = [];
    try {
      Response response = await api.sendRequest.get(
          "/staff/getResultSelfAssessStaff",
          options: Options(headers: header(token)),
          queryParameters: {
            "month": month,
            "year": year,
          });

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

  //Đánh giá các cấp trên
  //Các thành viên đánh giá lẫn nhau
}
