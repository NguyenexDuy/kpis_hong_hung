import 'package:hong_hung_application/models/models/user.dart';

class RsLeaderAsManager {
  int id;
  String staffCode;
  String managerName;
  String roomNameManager;
  String roomSymbolManager;
  String? rankManager;
  int? kyLuatKhenThuongManager;
  int? ktraGiamSatThucHienChuyenMonNv;
  int? bangChungHocTapPtManager;
  double? tbTapTheDanhGia;
  String? leaderCmt;
  int month;
  int year;
  String? createdAt;
  String assessedBy;
  User username;
  String uniqueUsername;
  String? timeSubmit;

  RsLeaderAsManager({
    required this.id,
    required this.staffCode,
    required this.managerName,
    required this.roomNameManager,
    required this.roomSymbolManager,
    this.rankManager,
    this.kyLuatKhenThuongManager,
    this.ktraGiamSatThucHienChuyenMonNv,
    this.bangChungHocTapPtManager,
    this.tbTapTheDanhGia,
    this.leaderCmt,
    required this.month,
    required this.year,
    this.createdAt,
    required this.assessedBy,
    required this.username,
    required this.uniqueUsername,
    this.timeSubmit,
  });
  factory RsLeaderAsManager.fromJson(Map<String, dynamic> json) {
    return RsLeaderAsManager(
      id: json['id'] as int,
      staffCode: json['staff_code'] as String,
      managerName: json['manager_name'] as String,
      roomNameManager: json['room_name_manager'] as String,
      roomSymbolManager: json['room_symbol_manager'] as String,
      rankManager: json['rank_manager'] as String?,
      kyLuatKhenThuongManager: json['ky_luat_khen_thuong_manager'] as int?,
      ktraGiamSatThucHienChuyenMonNv:
          json['ktra_giam_sat_thuc_hien_chuyen_mon_nv'] as int?,
      bangChungHocTapPtManager: json['bang_chung_hoc_tap_pt_manager'] as int?,
      tbTapTheDanhGia: json['tb_tap_the_danh_gia'] as double?,
      leaderCmt: json['leader_cmt'] as String?,
      month: json['month'] as int,
      year: json['year'] as int,
      createdAt: json['created_at'] as String?,
      assessedBy: json['assessed_by'] as String,
      username: User.fromJson(json['username']),
      uniqueUsername: json['unique_username'] as String,
      timeSubmit: json['time_submit'] as String?,
    );
  }
}
