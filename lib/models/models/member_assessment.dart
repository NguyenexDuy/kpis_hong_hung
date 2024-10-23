import 'package:hong_hung_application/models/models/user.dart';

class MemberAssessment {
  int? id;
  String? assessedBy;
  String? createdAt;
  int? markMemberAssess;
  String? memberName;
  int? month;
  String? noteDesc;
  String? position;
  String? roomName;
  String? staffCode;
  String? uniqueUsername;
  int? year;
  User? username;
  String? timeSubmit;

  MemberAssessment({
    this.id,
    this.assessedBy,
    this.createdAt,
    this.markMemberAssess,
    this.memberName,
    this.month,
    this.noteDesc,
    this.position,
    this.roomName,
    this.staffCode,
    this.uniqueUsername,
    this.year,
    this.username,
    this.timeSubmit,
  });

  // From JSON
  factory MemberAssessment.fromJson(Map<String, dynamic> json) {
    // print('JSON received: $json'); // Log toàn bộ JSON
    // print(
    //     'ID type: ${json['id']?.runtimeType}'); // Log kiểu dữ liệu của từng trường
    return MemberAssessment(
      id: json['id'],
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
      username:
          json['username'] != null ? User.fromJson(json['username']) : null,
      timeSubmit: json['time_submit'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
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
      'username': username?.toJson(),
      'time_submit': timeSubmit,
    };
  }
}
