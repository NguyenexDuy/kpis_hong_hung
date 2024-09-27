// xem cấp trên đánh giá
class RsManagerAsYourself {
  final int id;

  final String staffCode;
  final String memberName;
  final String position;
  final double markMemberAssessedAverage;
  final int kyLuatKhenThuongMember;
  final int chatLuongChuyenMonMember;
  final int bangChungHocTapPtMember;
  final String managerEvaluateCmt;
  final String roomName;
  final String roomSymbol;
  final int month;
  final int year;
  final String createdAt;
  final String assessedBy;
  final String uniqueUsername;
  final String timeSubmit;

  RsManagerAsYourself({
    required this.staffCode,
    required this.memberName,
    required this.position,
    required this.markMemberAssessedAverage,
    required this.kyLuatKhenThuongMember,
    required this.chatLuongChuyenMonMember,
    required this.bangChungHocTapPtMember,
    required this.managerEvaluateCmt,
    required this.roomName,
    required this.roomSymbol,
    required this.month,
    required this.year,
    required this.createdAt,
    required this.assessedBy,
    required this.uniqueUsername,
    required this.timeSubmit,
    required this.id,
  });

  factory RsManagerAsYourself.fromJson(Map<String, dynamic> json) {
    return RsManagerAsYourself(
      staffCode: json['staff_code'],
      memberName: json['member_name'],
      position: json['position'],
      markMemberAssessedAverage:
          json['mark_member_assessed_average'].toDouble(),
      kyLuatKhenThuongMember: json['ky_luat_khen_thuong_member'],
      chatLuongChuyenMonMember: json['chat_luong_chuyen_mon_member'],
      bangChungHocTapPtMember: json['bang_chung_hoc_tap_pt_member'],
      managerEvaluateCmt: json['manager_evaluate_cmt'],
      roomName: json['room_name'],
      roomSymbol: json['room_symbol'],
      month: json['month'],
      year: json['year'],
      createdAt: json['created_at'],
      assessedBy: json['assessed_by'],
      uniqueUsername: json['unique_username'],
      timeSubmit: json['time_submit'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      'id': id,
    };
  }
}
