import 'package:hong_hung_application/models/models/user.dart';

class StaffList {
  int id;
  String birthday;
  String email;
  String fullname;
  String roomName;
  String staffCode;
  String group_work;
  String rank_code;
  User user;
  StaffList({
    required this.id,
    required this.birthday,
    required this.email,
    required this.fullname,
    required this.roomName,
    required this.staffCode,
    required this.group_work,
    required this.rank_code,
    required this.user,
  });
  factory StaffList.fromJson(Map<String, dynamic> json) {
    return StaffList(
      id: json['id'],
      birthday: json['birthday'],
      email: json['email'],
      fullname: json['fullname'],
      roomName: json['room_name'],
      staffCode: json['staff_code'],
      group_work: json['group_work'],
      rank_code: json['rank_code'],
      user: User.fromJson(json['username']),
    );
  }
}
