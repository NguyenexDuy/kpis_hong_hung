import 'package:hong_hung_application/models/models/user.dart';

class ManagerAsLeader {
  int? id;
  String staffCode;
  String leaderName;
  String? rankLeader;
  String roomName;
  User? username;
  int? ganKetTaoDongLucNv;
  int? chatLuongHoTroGiaiQuyetVd;
  double? tbGanKetVaHoTro;
  String? noteDesc;
  int? month;
  int? year;
  String? createdAt;
  String assessedBy;
  String roomNameAsser;
  String uniqueUsername;
  String? rankAsser;
  String? timeSubmit;
  ManagerAsLeader({
    this.id,
    required this.staffCode,
    required this.leaderName,
    this.rankLeader,
    required this.roomName,
    this.username,
    this.ganKetTaoDongLucNv,
    this.chatLuongHoTroGiaiQuyetVd,
    this.tbGanKetVaHoTro,
    this.noteDesc,
    this.month,
    this.year,
    this.createdAt,
    required this.assessedBy,
    required this.roomNameAsser,
    required this.uniqueUsername,
    this.rankAsser,
    this.timeSubmit,
  });

  factory ManagerAsLeader.fromJson(Map<String, dynamic> json) {
    return ManagerAsLeader(
      id: json['id'],
      staffCode: json['staff_code'],
      leaderName: json['leader_name'],
      rankLeader: json['rank_leader'],
      roomName: json['room_name'],
      username:
          json['username'] != null ? User.fromJson(json['username']) : null,
      ganKetTaoDongLucNv: json['gan_ket_tao_dong_luc_nv'],
      chatLuongHoTroGiaiQuyetVd: json['chat_luong_ho_tro_giai_quyet_vd'],
      tbGanKetVaHoTro: json['tb_gan_ket_va_ho_tro'],
      noteDesc: json['note_desc'],
      month: json['month'],
      year: json['year'],
      createdAt: json['created_at'],
      assessedBy: json['assessed_by'],
      roomNameAsser: json['room_name_asser'],
      uniqueUsername: json['unique_username'],
      rankAsser: json['rank_asser'],
      timeSubmit: json['time_submit'],
    );
  }
}
