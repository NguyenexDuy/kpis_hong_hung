import 'package:hong_hung_application/models/group_rank.dart';

class RankStaff {
  int id;
  String rank_code;
  String rank_name;
  double ts_kpi;
  double ts_mt;
  GroupRank groupRank;

  RankStaff({
    required this.id,
    required this.rank_code,
    required this.rank_name,
    required this.ts_kpi,
    required this.ts_mt,
    required this.groupRank,
  });

  factory RankStaff.fromJson(Map<String, dynamic> json) => RankStaff(
      id: json['id'],
      rank_code: json['rank_code'],
      rank_name: json['rank_name'],
      ts_kpi: json['ts_kpi'],
      ts_mt: json['ts_mt'],
      groupRank: GroupRank.fromJson(json['group_rank_staff']));
}
