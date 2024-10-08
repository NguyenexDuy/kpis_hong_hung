import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hong_hung_application/api/api.dart';
import 'package:hong_hung_application/models/models/kpi_room_data.dart';
import 'package:hong_hung_application/models/models/name_list_kpi.dart';
import 'package:hong_hung_application/models/models/room_type.dart';
import 'package:hong_hung_application/storage/security_storage.dart';

class RoomRepo {
  API api = API();

  //thêm mới chỉ số KPI các Khoa/Phòng
  Future<bool> addKpiForRoom(
      String kpiName,
      String kpiType,
      String compareType,
      String roomResponsibleSymbol,
      String roomReportSymbol,
      String note) async {
    log("dang thuc hien add kpi for room");
    String token = await SecurityStorage.getToken();
    Map<String, dynamic> body = {
      "kpi_name": kpiName,
      "kpi_type": kpiType,
      "compare_type": compareType,
      "room_responsible_symbol": roomResponsibleSymbol,
      "room_report_symbol": roomReportSymbol,
      "note": note,
    };
    try {
      Response response = await api.sendRequest.post(
        "/room/saveKpiName",
        options: Options(headers: header(token)),
        data: body,
      );
      if (response.data['code'] == 1000) {
        return true;
      }
      return false;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  Future<List<RoomType>> getAllRoomForAddKPI() async {
    log("dang thuc hien get all room type");
    List<RoomType> list = [];
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
        "/room/getAllRoomForAddKPI",
        options: Options(headers: header(token)),
      );
      var data = response.data['result'];
      // log(jsonEncode(data));
      if (data is List) {
        list = data.map((e) => RoomType.fromJson(e)).toList();
      }
      return list;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //Xem chỉ số KPI các Khoa/Phòng
  Future<List<NameListKpi>> getAllListKpi() async {
    log("dang thuc hien get all list kpi");
    List<NameListKpi> list = [];
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
        "/room/getAllKpiName",
        options: Options(headers: header(token)),
      );
      var data = response.data['result'];
      // log("data body: $data");
      if (data is List) {
        list = data.map((e) => NameListKpi.fromJson(e)).toList();
      }
      return list;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //Nhập số liệu KPI cho Khoa/Phòng theo tháng
  Future<List<KpiRoomData>> enterKPI(int month, int year) async {
    log("dang thuc hien nhap so lieu kpi theo thang");
    List<KpiRoomData> list = [];
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
        "/room/kpiInputment",
        queryParameters: {
          "month": month,
          "year": year,
        },
        options: Options(headers: header(token)),
      );
      var data = response.data['result']['kpiRoomInputList'];
      // log("data body: $data");
      if (data is List) {
        list = data.map((e) => KpiRoomData.fromJson(e)).toList();
      }
      return list;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //Kết quả KPI KHoa/Phòng phụ trách
  Future<List<KpiRoomData>> getAllKPIRoomData(int month, int year) async {
    log("dang thuc hien lay ket qua kpi khoa/phong phu trach");
    List<KpiRoomData> list = [];
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
        "/room/getAllKPIRoomData",
        queryParameters: {
          "month": month,
          "year": year,
        },
        options: Options(headers: header(token)),
      );
      var data = response.data['result'];
      // log("data body: $data");
      if (data is List) {
        list = data.map((e) => KpiRoomData.fromJson(e)).toList();
      }
      return list;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }
}
