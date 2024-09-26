class RoomType {
  int room_id;
  String created_at;
  String created_by;
  String room_name;
  String room_symbol;
  String unique_username;

  RoomType({
    required this.room_id,
    required this.created_at,
    required this.created_by,
    required this.room_name,
    required this.room_symbol,
    required this.unique_username,
  });

  factory RoomType.fromJson(Map<String, dynamic> json) {
    return RoomType(
      room_id: json['room_id'],
      created_at: json['created_at'],
      created_by: json['created_by'],
      room_name: json['room_name'],
      room_symbol: json['room_symbol'],
      unique_username: json['unique_username'],
    );
  }
}
