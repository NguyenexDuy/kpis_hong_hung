import 'package:hong_hung_application/models/rank_staff.dart';
import 'package:hong_hung_application/models/role.dart';
import 'package:hong_hung_application/models/room_type.dart';

class User {
  int id;
  String createdAt;
  String? email;
  String fullname;
  String password;
  String status;
  String username;
  Role role;
  RoomType roomType;
  RankStaff rankCode;
  String groupWork;

  User({
    required this.id,
    required this.createdAt,
    this.email,
    required this.fullname,
    required this.password,
    required this.status,
    required this.username,
    required this.role,
    required this.roomType,
    required this.rankCode,
    required this.groupWork,
  });
}
