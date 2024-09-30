class RsPersonalKpi {
  int id;
  String staffCode;
  String? fullname;
  String roomName;
  String roomSymbol;
  double? teamMarkAssess;
  double? cs1;
  double? cs2;
  double? cs3;
  double? resultKPI;
  int month;
  int year;
  String? date;
  String? timeSubmit;
  String rankCode;

  RsPersonalKpi({
    required this.id,
    required this.staffCode,
    this.fullname,
    required this.roomName,
    required this.roomSymbol,
    this.teamMarkAssess,
    this.cs1,
    this.cs2,
    this.cs3,
    this.resultKPI,
    required this.month,
    required this.year,
    this.date,
    this.timeSubmit,
    required this.rankCode,
  });
  factory RsPersonalKpi.fromJson(Map<String, dynamic> json) {
    return RsPersonalKpi(
      id: json['id'] as int,
      staffCode: json['staff_code'] as String,
      fullname: json['fullname'] as String?,
      roomName: json['room_name'] as String,
      roomSymbol: json['room_symbol'] as String,
      teamMarkAssess: (json['team_mark_assess'] as num?)?.toDouble(),
      cs1: (json['cs1'] as num?)?.toDouble(),
      cs2: (json['cs2'] as num?)?.toDouble(),
      cs3: (json['cs3'] as num?)?.toDouble(),
      resultKPI: (json['resultKPI'] as num?)?.toDouble(),
      month: json['month'] as int,
      year: json['year'] as int,
      date: json['date'] as String?,
      timeSubmit: json['time_submit'] as String?,
      rankCode: json['rank_code'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'staff_code': staffCode,
      'fullname': fullname,
      'room_name': roomName,
      'room_symbol': roomSymbol,
      'team_mark_assess': teamMarkAssess,
      'cs1': cs1,
      'cs2': cs2,
      'cs3': cs3,
      'resultKPI': resultKPI,
      'month': month,
      'year': year,
      'date': date,
      'time_submit': timeSubmit,
      'rank_code': rankCode,
    };
  }
}
