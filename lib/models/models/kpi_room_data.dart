import 'package:hong_hung_application/models/models/name_kpi_list.dart';
import 'package:hong_hung_application/models/models/user.dart';

class KpiRoomData {
  int? id;
  String kpiName;
  NameKpiList? kpiNameId;
  String kpiType;
  String? roomReport;
  String roomReportSymbol;
  String? roomResponsible;
  String roomResponsibleSymbol;
  double tsThucHien;
  double msChung;
  double chiTieu;
  String? currency;
  String compareType;
  String? goal;
  double kqCs;
  double diemHieuChinh;
  double kqKpi;
  int month;
  int year;
  String? createdAt;
  String? createdBy;
  String? timeSubmit;
  User? username;

  KpiRoomData({
    this.id,
    required this.kpiName,
    this.kpiNameId,
    required this.kpiType,
    this.roomReport,
    required this.roomReportSymbol,
    this.roomResponsible,
    required this.roomResponsibleSymbol,
    required this.tsThucHien,
    required this.msChung,
    required this.chiTieu,
    this.currency,
    required this.compareType,
    this.goal,
    required this.kqCs,
    required this.diemHieuChinh,
    required this.kqKpi,
    required this.month,
    required this.year,
    this.createdAt,
    this.createdBy,
    this.timeSubmit,
    this.username,
  });
  factory KpiRoomData.fromJson(Map<String, dynamic> json) {
    return KpiRoomData(
      id: json['id'],
      kpiName: json['kpi_name'],
      kpiNameId: json['kpi_name_id'] != null
          ? NameKpiList.fromJson(json['kpi_name_id'])
          : null,
      kpiType: json['kpi_type'],
      roomReport: json['room_report'],
      roomReportSymbol: json['room_report_symbol'],
      roomResponsible: json['room_responsible'],
      roomResponsibleSymbol: json['room_responsible_symbol'],
      tsThucHien: json['ts_thuc_hien'],
      msChung: json['ms_chung'],
      chiTieu: json['chi_tieu'],
      currency: json['currency'],
      compareType: json['compare_type'],
      goal: json['goal'],
      kqCs: json['kq_cs'],
      diemHieuChinh: json['diem_hieu_chinh'],
      kqKpi: json['kq_kpi'],
      month: json['month'],
      year: json['year'],
      createdAt: json['created_at'],
      createdBy: json['created_by'],
      timeSubmit: json['time_submit'],
      username:
          json['username'] != null ? User.fromJson(json['username']) : null,
    );
  }
}
