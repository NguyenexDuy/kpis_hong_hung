class SelfAsManager {
  final int? id;
  final String staffCode;
  final String? name;
  final String rank;
  final String? groupRank;
  final int month;
  final int year;
  final int kyLuatVaThuong;
  final int ganKetTaoDongLucNv;
  final int chatLuongToChucPhanCongCv;
  final int ktraGiamSatChuyenMonNv;
  final int diemMucDoHocTapPt;
  final String? note;
  final String roomName;
  final String roomSymbol;
  final String? createdAt;
  final String? createdBy;
  final String? timeSubmit;

  SelfAsManager({
    this.id,
    required this.staffCode,
    this.name,
    required this.rank,
    this.groupRank,
    required this.month,
    required this.year,
    required this.kyLuatVaThuong,
    required this.ganKetTaoDongLucNv,
    required this.chatLuongToChucPhanCongCv,
    required this.ktraGiamSatChuyenMonNv,
    required this.diemMucDoHocTapPt,
    this.note,
    required this.roomName,
    required this.roomSymbol,
    this.createdAt,
    this.createdBy,
    this.timeSubmit,
  });
  factory SelfAsManager.fromJson(Map<String, dynamic> json) {
    return SelfAsManager(
      staffCode: json['staff_code'],
      name: json['name'],
      rank: json['rank'],
      groupRank: json['group_rank'],
      month: json['month'],
      year: json['year'],
      kyLuatVaThuong: json['ky_luat_va_thuong'],
      ganKetTaoDongLucNv: json['gan_ket_tao_dong_luc_nv'],
      chatLuongToChucPhanCongCv: json['chat_luong_to_chuc_phan_cong_cv'],
      ktraGiamSatChuyenMonNv: json['ktra_giam_sat_chuyen_mon_nv'],
      diemMucDoHocTapPt: json['diem_muc_do_hoc_tap_pt'],
      note: json['note'],
      roomName: json['room_name'],
      roomSymbol: json['room_symbol'],
      createdAt: json['created_at'],
      createdBy: json['created_by'],
      timeSubmit: json['time_submit'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'staff_code': staffCode,
      'name': name,
      'rank': rank,
      'group_rank': groupRank,
      'month': month,
      'year': year,
      'ky_luat_va_thuong': kyLuatVaThuong,
      'gan_ket_tao_dong_luc_nv': ganKetTaoDongLucNv,
      'chat_luong_to_chuc_phan_cong_cv': chatLuongToChucPhanCongCv,
      'ktra_giam_sat_chuyen_mon_nv': ktraGiamSatChuyenMonNv,
      'diem_muc_do_hoc_tap_pt': diemMucDoHocTapPt,
      'note': note,
      'room_name': roomName,
      'room_symbol': roomSymbol,
      'created_by': createdBy,
    };
  }
}
