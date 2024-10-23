import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hong_hung_application/api/api.dart';
import 'package:hong_hung_application/models/models/manager_as_leader.dart';
import 'package:hong_hung_application/models/models/manager_as_member.dart';
import 'package:hong_hung_application/models/models/self_as_manager.dart';
import 'package:hong_hung_application/models/result/rs_leader_as_manager.dart';
import 'package:hong_hung_application/models/result/rs_manager_as_member.dart';
import 'package:hong_hung_application/models/result/rs_member_as_manager.dart';
import 'package:hong_hung_application/models/result/rs_member_assess.dart';
import 'package:hong_hung_application/models/result/rs_selt_assessment_dyary.dart';
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

//kết quả tự đánh giá
  Future<List<ResultSeltAssessmentDyary_MD>> getSelfAsManager(
      int month, int year) async {
    log("Dang thuc hien lay ket qua tu danh gia cua manager");
    String token = await SecurityStorage.getToken();
    List<ResultSeltAssessmentDyary_MD> mList = [];
    try {
      Response response = await api.sendRequest.get(
          "/manager/getResultSelfAsscessManger",
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

  //kết quả đánh giá lãnh đạo
  //xem BGĐ đánh giá
  Future<List<RsLeaderAsManager>> getResultLeaderAssessManager(
      int month, int year) async {
    log("Dang thuc hien lay ket qua danh gia lanh dao");
    String token = await SecurityStorage.getToken();

    List<RsLeaderAsManager> mlist = [];
    try {
      Response response = await api.sendRequest.get(
        "/manager/getResultLeaderAssessManager",
        queryParameters: {"month": month, "year": year},
        options: Options(headers: header(token)),
      );

      if (response.statusCode == 200) {
        var data = response.data["result"];
        // log("Du lieu tra ve: $data");
        if (data is List) {
          // Kiểm tra kiểu dữ liệu
          mlist = data.map((e) => RsLeaderAsManager.fromJson(e)).toList();
        }
        log("da lay xong");
      }
      return mlist;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

//kết quả quản lý đánh giá nhân viên
  Future<List<RsManagerAsMember>> getResultManagerAssessMember(
      int month, int year) async {
    log("Dang thuc hien lay ket qua quan ly danh gia nhan vien");
    String token = await SecurityStorage.getToken();
    List<RsManagerAsMember> mlist = [];
    try {
      Response response = await api.sendRequest.get(
          "/manager/getResultManagerAssessMember",
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
          mlist = data.map((e) => RsManagerAsMember.fromJson(e)).toList();
        }
        log("da lay xong");
      }
      return mlist;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

//y kien nhan vien danh gia lan nhau
  Future<List<RsMemberAssess>> getResultMemberOpinion(
      int month, int year) async {
    log("Dang thuc hien lay y kien nhan vien danh gia");
    String token = await SecurityStorage.getToken();
    List<RsMemberAssess> mlist = [];
    try {
      Response response = await api.sendRequest.get(
          "/manager/getResultMemberOpinion",
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
          mlist = data.map((e) => RsMemberAssess.fromJson(e)).toList();
        }
        log("da lay xong");
      }
      return mlist;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //đánh giá lãnh đạo quản lý  trực tiếp
  Future<List<ManagerAsLeader>> getResultmanagerLeaderAssessment(
      int month, int year) async {
    log("Dang thuc hien lay danh gia lanh dao quan ly truc tiep");
    String token = await SecurityStorage.getToken();
    List<ManagerAsLeader> mlist = [];
    try {
      Response response = await api.sendRequest.get(
          "/manager/getResultmanagerLeaderAssessment",
          options: Options(headers: header(token)),
          queryParameters: {
            'month': month,
            'year': year,
          });

      var data = response.data['result']['managerAssessLeaderList'];

      // log("LỤM ${jsonEncode(data)}");
      if (data is List) {
        mlist = data.map((e) => ManagerAsLeader.fromJson(e)).toList();
      }
      return mlist;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //đánh giá phó khoa/phòng hoặc ĐDT/KTYT/HST
  Future<List<ManagerAsMember>> managerCaptainAssessment(
      int month, int year) async {
    log("Dang thuc hien lay danh gia pho khoa/phong hoac DDT/KTYT/HST");
    String token = await SecurityStorage.getToken();
    List<ManagerAsMember> mlist = [];
    try {
      Response response = await api.sendRequest.get(
          "/manager/managerCaptainAssessment",
          options: Options(headers: header(token)),
          queryParameters: {
            'month': month,
            'year': year,
          });

      var data = response.data['result']['managerAssessMemberList'];

      // log("LỤM ${jsonEncode(data)}");
      if (data is List) {
        mlist = data.map((e) => ManagerAsMember.fromJson(e)).toList();
      }
      return mlist;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //Trưởng nhóm đánh giá các trưởng nhóm( nếu có)
  Future<List<ManagerAsMember>> captainAssessment(int month, int year) async {
    log("Dang thuc hien lay danh gia Trưởng nhóm đánh giá các trưởng nhóm( nếu có) ");
    String token = await SecurityStorage.getToken();
    List<ManagerAsMember> mlist = [];
    try {
      Response response = await api.sendRequest.get(
          "/manager/captainAssessment",
          options: Options(headers: header(token)),
          queryParameters: {
            'month': month,
            'year': year,
          });

      var data = response.data['result']['managerAssessMemberList'];

      // log("LỤM ${jsonEncode(data)}");
      if (data is List) {
        mlist = data.map((e) => ManagerAsMember.fromJson(e)).toList();
      }
      return mlist;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  Future<bool> saveSelfAssessManager(SelfAsManager params) async {
    log("Dang thuc hien tu danh gia ban than (manager)");
    String token = await SecurityStorage.getToken();

    try {
      Response response = await api.sendRequest.post(
          "/manager/saveSelfAssessManager",
          options: Options(headers: header(token)),
          data: params.toJson());
      if (response.data['code'] == 1000) {
        log("danh gia thanh cong");
        return true;
      } else {
        log("danh gia that bai: ${response.data['result']}");
        return false;
      }
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  Future<List<ManagerAsMember>> groupAssessment(int month, int year) async {
    log("Dang thuc hien Điều dưỡng/KTY/Hộ sinh trưởng khoa đánh giá các nhân viên không có trưởng nhóm");
    String token = await SecurityStorage.getToken();
    List<ManagerAsMember> mlist = [];
    try {
      Response response = await api.sendRequest.get("/manager/groupAssessment",
          options: Options(headers: header(token)),
          queryParameters: {"month": month, "year": year});
      var data = response.data['result']['managerAssessMemberList'];
      if (data is List) {
        mlist = data.map((e) => ManagerAsMember.fromJson(e)).toList();
      }

      // log("lum data: ${jsonEncode(data)}");
      return mlist;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }
}
