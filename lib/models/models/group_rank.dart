class GroupRank {
  int id;
  String groupName;
  double ts1;
  double ts2;
  double ts3;
  GroupRank({
    required this.id,
    required this.groupName,
    required this.ts1,
    required this.ts2,
    required this.ts3,
  });

  factory GroupRank.fromJson(Map<String, dynamic> json) {
    return GroupRank(
      id: json['id'],
      groupName: json['group_name'],
      ts1: json['ts1'],
      ts2: json['ts2'],
      ts3: json['ts3'],
    );
  }
}
