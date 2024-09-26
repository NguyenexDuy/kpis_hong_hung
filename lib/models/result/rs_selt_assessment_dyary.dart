import 'dart:convert';

class ResultSeltAssessmentDyary {
  int id;
  String staff_code;
  String name;
  String rank;
  String group_rank;
  int month;
  int year;
  int ky_luat_va_thuong;
  int muc_do_phoi_hop;
  int chat_luong_chuyen_mon;
  int diem_muc_do_hoc_tap_pt;
  String note;
  String room_name;
  String room_symbol;
  String created_at;
  String created_by;
  String time_submit;

  ResultSeltAssessmentDyary({
    required this.id,
    required this.staff_code,
    required this.name,
    required this.rank,
    required this.group_rank,
    required this.month,
    required this.year,
    required this.ky_luat_va_thuong,
    required this.muc_do_phoi_hop,
    required this.chat_luong_chuyen_mon,
    required this.diem_muc_do_hoc_tap_pt,
    required this.note,
    required this.room_name,
    required this.room_symbol,
    required this.created_at,
    required this.created_by,
    required this.time_submit,
  });

  factory ResultSeltAssessmentDyary.fromJson(Map<String, dynamic> json) =>
      ResultSeltAssessmentDyary(
        id: json['id'],
        staff_code: json['staff_code'],
        name: json['name'],
        rank: json['rank'],
        group_rank: json['group_rank'],
        month: json['month'],
        year: json['year'],
        ky_luat_va_thuong: json['ky_luat_va_thuong'],
        muc_do_phoi_hop: json['muc_do_phoi_hop'],
        chat_luong_chuyen_mon: json['chat_luong_chuyen_mon'],
        diem_muc_do_hoc_tap_pt: json['diem_muc_do_hoc_tap_pt'],
        note: json['note'],
        room_name: json['room_name'],
        room_symbol: json['room_symbol'],
        created_at: json['created_at'],
        created_by: json['created_by'],
        time_submit: json['time_submit'],
      );
}
