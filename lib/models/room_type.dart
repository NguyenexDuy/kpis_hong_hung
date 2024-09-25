import 'package:hong_hung_application/models/user.dart';

class RoomType {
  int room_id;
  String created_at;
  String created_by;
  String room_name;
  String room_symbol;
  User user;

  RoomType({
    required this.room_id,
    required this.created_at,
    required this.created_by,
    required this.room_name,
    required this.room_symbol,
    required this.user,
  });
}
