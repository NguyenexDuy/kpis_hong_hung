import 'package:hong_hung_application/models/models/user.dart';

class StaffList {
  int id;
  String birthday;
  String email;
  String fullname;
  String roomName;
  String staffCode;
  User user;
  StaffList({
    required this.id,
    required this.birthday,
    required this.email,
    required this.fullname,
    required this.roomName,
    required this.staffCode,
    required this.user,
  });
}
