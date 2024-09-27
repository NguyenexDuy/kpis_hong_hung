//kết quả đánh giá cấp nhân viên
class RsMemberAssess {
  final String assessedBy;
  final String createdAt;
  final int markMemberAssess;
  final String memberName;
  final int month;
  final String noteDesc;
  final String position;
  final String roomName;
  final String staffCode;
  final String uniqueUsername;
  final int year;
  final String timeSubmit;
  final int id;

  RsMemberAssess({
    required this.assessedBy,
    required this.createdAt,
    required this.markMemberAssess,
    required this.memberName,
    required this.month,
    required this.noteDesc,
    required this.position,
    required this.roomName,
    required this.staffCode,
    required this.uniqueUsername,
    required this.year,
    required this.timeSubmit,
    required this.id,
  });

  factory RsMemberAssess.fromJson(Map<String, dynamic> json) {
    return RsMemberAssess(
      assessedBy: json['assessed_by'],
      createdAt: json['created_at'],
      markMemberAssess: json['mark_member_assess'],
      memberName: json['member_name'],
      month: json['month'],
      noteDesc: json['note_desc'],
      position: json['position'],
      roomName: json['room_name'],
      staffCode: json['staff_code'],
      uniqueUsername: json['unique_username'],
      year: json['year'],
      timeSubmit: json['time_submit'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'assessed_by': assessedBy,
      'created_at': createdAt,
      'mark_member_assess': markMemberAssess,
      'member_name': memberName,
      'month': month,
      'note_desc': noteDesc,
      'position': position,
      'room_name': roomName,
      'staff_code': staffCode,
      'unique_username': uniqueUsername,
      'year': year,
      'time_submit': timeSubmit,
      'id': id,
    };
  }
}
