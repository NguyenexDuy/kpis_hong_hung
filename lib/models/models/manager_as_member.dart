import 'package:hong_hung_application/models/models/user.dart';

class ManagerAsMember {
  final int? id;
  final String? staffCode;
  final String? memberName;
  final String? position; // cấp nhân sự của người được đánh giá
  final User? username; // Tương ứng với User entity

  final double? markMemberAssessedAverage;
  final int? kyLuatKhenThuongMember;
  final int? chatLuongChuyenMonMember; // Chất lượng chuyên môn của nhân viên
  final int? bangChungHocTapPtMember; // Bằng chứng học tập phát triển

  final String? managerEvaluateCmt; // Nhận xét đánh giá từ quản lý
  final String? roomName;
  final String? roomSymbol;

  final int? month;
  final int? year;
  final String? createdAt;
  final String? assessedBy; // Người đánh giá
  final String? uniqueUsername; // Username của người đánh giá
  final String? timeSubmit; // Ngày submit đánh giá
  ManagerAsMember({
    this.id,
    this.staffCode,
    this.memberName,
    this.position,
    this.username,
    this.markMemberAssessedAverage,
    this.kyLuatKhenThuongMember,
    this.chatLuongChuyenMonMember,
    this.bangChungHocTapPtMember,
    this.managerEvaluateCmt,
    this.roomName,
    this.roomSymbol,
    this.month,
    this.year,
    this.createdAt,
    this.assessedBy,
    this.uniqueUsername,
    this.timeSubmit,
  });
  factory ManagerAsMember.fromJson(Map<String, dynamic> json) {
    return ManagerAsMember(
      id: json['id'],
      staffCode: json['staff_code'],
      memberName: json['member_name'],
      position: json['position'],
      username:
          json['username'] != null ? User.fromJson(json['username']) : null,
      markMemberAssessedAverage:
          json['mark_member_assessed_average']?.toDouble(),
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
    );
  }
}
