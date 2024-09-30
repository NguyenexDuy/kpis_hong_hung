import 'package:hong_hung_application/models/models/user.dart';

class RsManagerAsMember {
  int id;
  String staffCode;
  String memberName;
  String? position;
  User? username;
  double? markMemberAssessedAverage;
  int? kyLuatKhenThuongMember;
  int? chatLuongChuyenMonMember;
  int? bangChungHocTapPtMember;
  String? managerEvaluateCmt;
  String roomName;
  String roomSymbol;
  int month;
  int year;
  String? createdAt;
  String assessedBy;
  String uniqueUsername;
  String? timeSubmit;

  RsManagerAsMember({
    required this.id,
    required this.staffCode,
    required this.memberName,
    this.position,
    this.markMemberAssessedAverage,
    this.kyLuatKhenThuongMember,
    this.chatLuongChuyenMonMember,
    this.bangChungHocTapPtMember,
    this.managerEvaluateCmt,
    required this.roomName,
    required this.roomSymbol,
    required this.month,
    required this.year,
    this.createdAt,
    required this.assessedBy,
    required this.uniqueUsername,
    this.timeSubmit,
  });
  factory RsManagerAsMember.fromJson(Map<String, dynamic> json) {
    return RsManagerAsMember(
      id: json['id'] as int,
      staffCode: json['staff_code'] as String,
      memberName: json['member_name'] as String,
      position: json['position'] as String?,
      markMemberAssessedAverage:
          (json['mark_member_assessed_average'] as num?)?.toDouble(),
      kyLuatKhenThuongMember: json['ky_luat_khen_thuong_member'] as int?,
      chatLuongChuyenMonMember: json['chat_luong_chuyen_mon_member'] as int?,
      bangChungHocTapPtMember: json['bang_chung_hoc_tap_pt_member'] as int?,
      managerEvaluateCmt: json['manager_evaluate_cmt'] as String?,
      roomName: json['room_name'] as String,
      roomSymbol: json['room_symbol'] as String,
      month: json['month'] as int,
      year: json['year'] as int,
      createdAt: json['created_at'] as String?,
      assessedBy: json['assessed_by'] as String,
      uniqueUsername: json['unique_username'] as String,
      timeSubmit: json['time_submit'] as String?,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'staff_code': staffCode,
      'member_name': memberName,
      'position': position,
      'mark_member_assessed_average': markMemberAssessedAverage,
      'ky_luat_khen_thuong_member': kyLuatKhenThuongMember,
      'chat_luong_chuyen_mon_member': chatLuongChuyenMonMember,
      'bang_chung_hoc_tap_pt_member': bangChungHocTapPtMember,
      'manager_evaluate_cmt': managerEvaluateCmt,
      'room_name': roomName,
      'room_symbol': roomSymbol,
      'month': month,
      'year': year,
      'created_at': createdAt,
      'assessed_by': assessedBy,
      'unique_username': uniqueUsername,
      'time_submit': timeSubmit,
    };
  }
}
