import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hong_hung_application/api/api.dart';
import 'package:hong_hung_application/models/models/rank_staff.dart';
import 'package:hong_hung_application/models/models/role.dart';
import 'package:hong_hung_application/models/models/room_type.dart';
import 'package:hong_hung_application/models/models/staff_list.dart';
import 'package:hong_hung_application/models/models/user.dart';
import 'package:hong_hung_application/storage/security_storage.dart';

class AdminRepo {
  API api = API();

// quản lý user
  Future<List<User>> getAllUser() async {
    log("dang thuc hien get all user");
    List<User> users = [];
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
        "/admin/getAllUser",
        options: Options(headers: header(token)),
      );
      var data = response.data['result'];
      // log("data body: $data");
      if (data is List) {
        users = data.map((e) => User.fromJson(e)).toList();
      }
      return users;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

//get all RanksTaff for edit/create

  Future<List<RankStaff>> getAllRankStaffForEditCreate() async {
    log("dang thuc hien get rank staff for edit/create");
    List<RankStaff> rankStaffList = [];
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
        '/admin/getAllRankStaff',
        options: Options(headers: header(token)),
      );
      var data = response.data['result'];
      // log(jsonEncode(data));
      if (data is List) {
        rankStaffList = data.map((e) => RankStaff.fromJson(e)).toList();
      }
      return rankStaffList;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //get all Role for edit/create
  Future<List<Role>> getAllRoleUser() async {
    log("dang thuc hien get rank staff for edit/create");
    List<Role> roleList = [];
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
        '/admin/getAllRole',
        options: Options(headers: header(token)),
      );
      var data = response.data['result'];
      // log(jsonEncode(data));
      if (data is List) {
        roleList = data.map((e) => Role.fromJson(e)).toList();
      }
      return roleList;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

// quản lý staffs
  Future<List<StaffList>> getAllStaff() async {
    log("dang thuc hien get all staff");
    List<StaffList> staffs = [];
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
        '/admin/getAllStaff',
        options: Options(headers: header(token)),
      );
      var data = response.data['result'];
      // log(data);
      if (data is List) {
        staffs = data.map((e) => StaffList.fromJson(e)).toList();
      }
      return staffs;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //get all user for create room
  Future<List<User>> getAllUserForCreateRoom() async {
    log("dang thuc hien lay user for create room");
    List<User> users = [];
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
        "/admin/getAllForSave",
        options: Options(headers: header(token)),
      );
      var data = response.data['result'];
      // log(jsonEncode(data));
      if (data is List) {
        users = data.map((e) => User.fromJson(e)).toList();
      }
      return users;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //get all user for edit room
  Future<List<User>> getAllUserForEditRoom() async {
    log("dang thuc hien lay user for edit room");
    List<User> users = [];
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
        "/admin/getAllForEditRoom",
        options: Options(headers: header(token)),
      );
      var data = response.data['result'];
      if (data is List) {
        users = data.map((e) => User.fromJson(e)).toList();
      }
      return users;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //them phong moi
  Future<bool> addNewRoom(String roomName, String roomSymbol,
      String uniqueUsername, String createdBy) async {
    log("dang thuc hien them phong moi");
    String token = await SecurityStorage.getToken();
    Map<String, dynamic> body = {
      "room_name": roomName,
      "room_symbol": roomSymbol,
      "unique_username": uniqueUsername,
      "created_by": createdBy
    };
    try {
      Response response = await api.sendRequest.post(
        "/admin/saveNewRoom",
        options: Options(headers: header(token)),
        data: body,
      );
      var result = response.data['code'];
      if (result == 1000) {
        log("SUCCESS");
        return true;
      } else {
        log("UN SUCCESS");
        return false;
      }
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //quản lý khoa/phòng
  Future<List<RoomType>> getAllRoom() async {
    log("dang thuc hien get all room");
    List<RoomType> rooms = [];
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
        "/admin/getAllRoom",
        options: Options(headers: header(token)),
      );
      var data = response.data['result'];
      // log(jsonEncode(data));
      if (data is List) {
        rooms = data.map((e) => RoomType.fromJson(e)).toList();
      }
      return rooms;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //thêm mới User
  Future<bool> saveAccount(
      String fullname,
      String password,
      String username,
      String email,
      String rank_code_ID,
      String group_work,
      String role_id,
      String room_type_ID,
      bool status) async {
    log("dang thuc hien them moi user");
    Map<String, dynamic> body = {
      "fullname": fullname,
      "password": password,
      "username": username,
      "email": email,
      "rank_code_ID": rank_code_ID,
      "group_work": group_work,
      "role_id": role_id,
      "room_type_ID": room_type_ID,
      "status": status,
    };
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.post(
        "/admin/SaveAccount",
        data: body,
        options: Options(headers: header(token)),
      );
      if (response.data['code'] == 1000) {
        log("Create user successed");
        return true;
      } else {
        log("Create user failed");

        return false;
      }
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //edit room
  Future<bool> editCurrentRoom(String idRoom, String roomName, String roomType,
      String unique_username) async {
    log("danh thuc hien edit current room");
    String token = await SecurityStorage.getToken();
    Map<String, dynamic> body = {
      "room_name": roomName,
      "room_symbol": roomType,
      "unique_username": unique_username
    };
    try {
      Response response = await api.sendRequest.put(
          "/admin/saveEditRoom/$idRoom",
          options: Options(headers: header(token)),
          data: body);
      return true;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  // Future<User> getUserByUniqueUser(String uniqueUser) async {
  //   log("danh thuc hien get user ");
  //   String token = await SecurityStorage.getToken();
  //   User user;
  //   try {
  //     Response response = await api.sendRequest.get(
  //         "/users/getUserByUniqueName/$uniqueUser",
  //         options: Options(headers: header(token)));
  //     var data = response.data['result'];
  //     user = User.fromJson(data);
  //     log(jsonEncode(data));
  //     return user;
  //   } catch (ex) {
  //     log(ex.toString());
  //     rethrow;
  //   }
  // }
  Future<User> getUserByUniqueUser(String uniqueUser) async {
    log("Đang thực hiện get user");
    String token = await SecurityStorage.getToken();
    User user;
    try {
      Response response = await api.sendRequest.get(
          "/users/getUserByUniqueName/$uniqueUser",
          options: Options(headers: header(token)));

      // Kiểm tra nếu response.data['result'] là null
      if (response.data == null || response.data['result'] == null) {
        log("Không tìm thấy user với uniqueUser: $uniqueUser");
        throw Exception("Không tìm thấy dữ liệu từ server");
      }

      var data = response.data['result'];
      user = User.fromJson(data);
      log(jsonEncode(data));
      return user;
    } catch (ex) {
      log("Lỗi xảy ra: $ex");
      rethrow;
    }
  }

  //edit user
  Future<String> editUser(
      int idUser,
      String fullName,
      String email,
      int rank_code_ID,
      String group_work,
      int role_id,
      int room_type_ID,
      bool status) async {
    log("dang thuc hien edit user");
    String token = await SecurityStorage.getToken();
    Map<String, dynamic> body = {
      "fullname": fullName,
      "email": email,
      "rank_code_ID": rank_code_ID,
      "group_work": group_work,
      "role_id": role_id,
      "room_type_ID": room_type_ID,
      "status": status,
    };
    try {
      Response response =
          await api.sendRequest.put("/admin/saveEditUser/$idUser",
              data: body,
              options: Options(
                headers: header(token),
              ));
      if (response.statusCode == 200) {
        return "SUCCESSED";
      } else {
        return "FAILED";
      }
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }

  //reset password
  Future<bool> resetPassword(int idUser) async {
    log("dang thuc hien reset pass");
    String token = await SecurityStorage.getToken();
    try {
      Response response = await api.sendRequest.get(
          "/admin/resetPassword/$idUser",
          options: Options(headers: header(token)));
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (ex) {
      log(ex.toString());
      rethrow;
    }
  }
}
