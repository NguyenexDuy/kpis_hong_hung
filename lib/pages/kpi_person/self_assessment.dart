import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/staff_repo.dart';
import 'package:hong_hung_application/const.dart';
import 'package:hong_hung_application/models/models/staff_list.dart';
import 'package:hong_hung_application/models/models/user.dart';
import 'package:hong_hung_application/widgets/dropdown_button_month.dart';
import 'package:hong_hung_application/widgets/dropdown_button_string.dart';

class SelfAssessment extends StatefulWidget {
  SelfAssessment({super.key, required this.user});
  User user;

  @override
  State<SelfAssessment> createState() => _SelfAssessmentState();
}

class _SelfAssessmentState extends State<SelfAssessment> {
  TextEditingController noteController = TextEditingController();
  List<Map<String, dynamic>> kiluatLDvaKt = kyloatLDvaKTList;
  List<Map<String, dynamic>> chatluongCMvaMucdoPH =
      clthCMandMdphthdcmcKhoaPhong;
  List<Map<String, dynamic>> mucdoHTvaPT = muc_do_hoc_tap;
  StaffList? staff;

  void getInfoStaff() async {
    staff = await StaffRepo().getStaffbyUsername(widget.user.username);
    log("rank staff: ${staff!.rank_code}");
  }

  @override
  void initState() {
    super.initState();
    getInfoStaff();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> valuechatluongLD = kiluatLDvaKt.first;
    Map<String, dynamic> chuluongCM = chatluongCMvaMucdoPH.first;
    Map<String, dynamic> mucdoHT = mucdoHTvaPT.first;
    Map<String, dynamic> mucdoPH = chatluongCMvaMucdoPH.first;
    int dropdownValueMonth = list.first;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tự đánh giá"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Staff code",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: staff!.staffCode,
                ),
              ),
              const Text(
                "Full Name",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              TextFormField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: staff!.fullname,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Tháng đánh giá"),
                            DropdownButtonMonth(
                              dropdownValue: dropdownValueMonth,
                              onMonthSelected: (value) {
                                dropdownValueMonth = value;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Năm đánh giá"),
                            Text("2024"),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: DropdownButtonString(
                  dropdownValue: valuechatluongLD,
                  myList: kiluatLDvaKt,
                  title: "Kỉ luật lao động và khen thưởng",
                  onChanged: (p0) {
                    valuechatluongLD = p0;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: DropdownButtonString(
                  dropdownValue: chuluongCM,
                  myList: chatluongCMvaMucdoPH,
                  title: "Chất lượng thực hiện chuyên môn",
                  onChanged: (p0) {
                    chuluongCM = p0;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: DropdownButtonString(
                  dropdownValue: mucdoHT,
                  myList: mucdoHTvaPT,
                  title: "Mức độ học tập và phát triển bản thân",
                  onChanged: (p0) {
                    mucdoHT = p0;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: DropdownButtonString(
                  dropdownValue: mucdoPH,
                  myList: chatluongCMvaMucdoPH,
                  title:
                      "Mức độ phối hợp trong hoạt động chuyên môn của khoa/phòng",
                  onChanged: (p0) {
                    mucdoPH = p0;
                  },
                ),
              ),
              TextField(
                  controller: noteController,
                  decoration: const InputDecoration(
                    hintText: "Ghi chú...",
                  )),
              ElevatedButton(
                  onPressed: () async {
                    String staffCode = staff!.staffCode;
                    String name = staff!.fullname;
                    String groupRank = staff!.group_work;
                    String rank = staff!.rank_code;
                    String roomName = staff!.roomName;
                    String roomSymbol = staff!.user.roomType.room_symbol;
                    String createdBy = staff!.user.username;
                    log("createdBy: $createdBy");
                    String note = noteController.text;
                    int month = dropdownValueMonth;
                    int year = 2024;
                    int kyluatvaThuong = int.parse(valuechatluongLD['id']);
                    int mucDoPhoiHop = int.parse(mucdoPH['id']);
                    int chatLuongChuyenMon = int.parse(chuluongCM['id']);
                    int diemMucDoHocTap = int.parse(mucdoHT['id']);
                    bool result = await StaffRepo().SeflAsStaff(
                        staffCode,
                        name,
                        rank,
                        groupRank,
                        roomName,
                        roomSymbol,
                        createdBy,
                        month,
                        year,
                        kyluatvaThuong,
                        chatLuongChuyenMon,
                        diemMucDoHocTap,
                        mucDoPhoiHop,
                        note);
                  },
                  child: const Text("Đánh giá"))
            ],
          ),
        ),
      ),
    );
  }
}
