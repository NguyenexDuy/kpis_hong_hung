class RsMemberAsManager {
  int id;
  String staff_code;
  String manager_name;
  String rank_manager;
  String gan_ket_tao_dong_luc_nv;
  String chat_luong_to_chuc_phan_cong_cv;
  String tb_gan_ket_va_phan_cong;
  String note_desc;
  String room_name;
  int month;
  int year;
  String created_at;
  String assessed_by;
  String unique_username;
  String position;
  String time_submit;

  RsMemberAsManager({
    required this.id,
    required this.staff_code,
    required this.manager_name,
    required this.rank_manager,
    required this.gan_ket_tao_dong_luc_nv,
    required this.chat_luong_to_chuc_phan_cong_cv,
    required this.tb_gan_ket_va_phan_cong,
    required this.note_desc,
    required this.room_name,
    required this.month,
    required this.year,
    required this.created_at,
    required this.assessed_by,
    required this.unique_username,
    required this.position,
    required this.time_submit,
  });
  factory RsMemberAsManager.fromJson(Map<String, dynamic> json) =>
      RsMemberAsManager(
        id: json['id'],
        staff_code: json['staff_code'],
        manager_name: json['manager_name'],
        rank_manager: json['rank_manager'],
        gan_ket_tao_dong_luc_nv: json['gan_ket_tao_dong_luc_nv'],
        chat_luong_to_chuc_phan_cong_cv:
            json['chat_luong_to_chuc_phan_cong_cv'],
        tb_gan_ket_va_phan_cong: json['tb_gan_ket_va_phan_cong'],
        note_desc: json['note_desc'],
        room_name: json['room_name'],
        month: json['month'],
        year: json['year'],
        created_at: json['created_at'],
        assessed_by: json['assessed_by'],
        unique_username: json['unique_username'],
        position: json['position'],
        time_submit: json['time_submit'],
      );
}
