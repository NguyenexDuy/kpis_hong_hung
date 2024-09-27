import 'package:hong_hung_application/models/models/rank_staff.dart';
import 'package:hong_hung_application/models/models/role.dart';
import 'package:hong_hung_application/models/models/room_type.dart';

class User {
  int id;
  String createdAt;
  String email;
  String fullname;
  String password;
  bool status;
  String username;
  List<Role> role;
  RoomType roomType;
  RankStaff rankCode;
  String groupWork;

  User({
    required this.id,
    required this.createdAt,
    required this.email,
    required this.fullname,
    required this.password,
    required this.status,
    required this.username,
    required this.role,
    required this.roomType,
    required this.rankCode,
    required this.groupWork,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        createdAt: json['created_at'],
        fullname: json['fullname'],
        password: json['password'],
        status: json['status'],
        email: json['email'],
        username: json['username'],
        role: (json['roles'] as List)
            .map((roleJson) => Role.fromJson(roleJson))
            .toList(),
        roomType: RoomType.fromJson(json['room_type']),
        rankCode: RankStaff.fromJson(json['rank_code']),
        groupWork: json['group_work'],
      );
}
