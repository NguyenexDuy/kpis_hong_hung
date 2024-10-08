class NameListKpi {
  int? id;
  String kpiName;
  String kpiType;
  String compareType;
  String roomName;
  String roomResponsibleSymbol;
  String roomReport;
  String roomReportSymbol;
  String? note;
  String? createdAt;
  String? createdBy;

  NameListKpi({
    this.id,
    required this.kpiName,
    required this.kpiType,
    required this.compareType,
    required this.roomName,
    required this.roomResponsibleSymbol,
    required this.roomReport,
    required this.roomReportSymbol,
    this.note,
    this.createdAt,
    this.createdBy,
  });
  factory NameListKpi.fromJson(Map<String, dynamic> json) {
    return NameListKpi(
      id: json['id'],
      kpiName: json['kpi_name'],
      kpiType: json['kpi_type'],
      compareType: json['compare_type'],
      roomName: json['room_name'],
      roomResponsibleSymbol: json['room_responsible_symbol'],
      roomReport: json['room_report'],
      roomReportSymbol: json['room_report_symbol'],
      note: json['note'],
      createdAt: json['created_at'],
      createdBy: json['created_by'],
    );
  }
}
