import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/manager_repo.dart';
import 'package:hong_hung_application/api/repository/staff_repo.dart';
import 'package:hong_hung_application/const.dart';
import 'package:hong_hung_application/models/models/self_as_manager.dart';
import 'package:hong_hung_application/models/models/staff_list.dart';
import 'package:hong_hung_application/models/models/user.dart';
import 'package:hong_hung_application/widgets/dropdown_button_month.dart';
import 'package:hong_hung_application/widgets/dropdown_button_string.dart';

class SelfAssessmentManagerPage extends StatefulWidget {
  const SelfAssessmentManagerPage({super.key, required this.user});
  final User user;
  @override
  State<SelfAssessmentManagerPage> createState() =>
      _SelfAssessmentManagerState();
}

class _SelfAssessmentManagerState extends State<SelfAssessmentManagerPage> {
  Future<StaffList>? stafffuture;
  List<Map<String, dynamic>> kiluatLDvaKt = kyloatLDvaKTList;
  List<Map<String, dynamic>> chatluongCMvaMucdoPH =
      clthCMandMdphthdcmcKhoaPhong;
  List<Map<String, dynamic>> mucdoHTvaPT = muc_do_hoc_tap;
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    stafffuture = StaffRepo().getStaffbyUsername(widget.user.username);
  }

  @override
  Widget build(BuildContext context) {
    int dropdownValueMonth = list.first;
    Map<String, dynamic> valueKiLuatLD = kiluatLDvaKt.first;
    Map<String, dynamic> valueMucDoGanKet = chatluongCMvaMucdoPH.first;
    Map<String, dynamic> valueChatLuongToChuc = chatluongCMvaMucdoPH.first;
    Map<String, dynamic> valueMucDoKiemtra = chatluongCMvaMucdoPH.first;
    Map<String, dynamic> valueMucDoHocTap = muc_do_hoc_tap.first;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tự đánh giá bản thân"),
      ),
      body: FutureBuilder(
          future: stafffuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Có lỗi xảy ra"));
            }
            StaffList staff = snapshot.data!;
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
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
                        hintText: staff.staffCode,
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
                        hintText: staff.fullname,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
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
                              height: 100,
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
                        dropdownValue: valueKiLuatLD,
                        myList: kiluatLDvaKt,
                        title: "Kỉ luật lao động và khen thưởng",
                        onChanged: (p0) {
                          valueKiLuatLD = p0;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: DropdownButtonString(
                        dropdownValue: valueMucDoGanKet,
                        myList: chatluongCMvaMucdoPH,
                        title: "Mức độ gắn kết, tạo động lực cho nv",
                        onChanged: (p0) {
                          valueMucDoGanKet = p0;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: DropdownButtonString(
                        dropdownValue: valueChatLuongToChuc,
                        myList: chatluongCMvaMucdoPH,
                        title:
                            "Chất lượng tổ chức, phân công công việc cho nv hợp lý",
                        onChanged: (p0) {
                          valueChatLuongToChuc = p0;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: DropdownButtonString(
                        dropdownValue: valueMucDoKiemtra,
                        myList: chatluongCMvaMucdoPH,
                        title:
                            "Mức độ kiểm tra, giám sát thực hiện chuyên môn của nv khoa/phòng, bộ phận",
                        onChanged: (p0) {
                          valueMucDoKiemtra = p0;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: DropdownButtonString(
                        dropdownValue: valueMucDoHocTap,
                        myList: mucdoHTvaPT,
                        title: "Mức độ học tập và phát triển bản thân",
                        onChanged: (p0) {
                          valueMucDoHocTap = p0;
                        },
                      ),
                    ),
                    TextField(
                      controller: noteController,
                      decoration: const InputDecoration(hintText: "Ghi chú"),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Center(
                        child: ElevatedButton(
                            onPressed: () async {
                              String staffCode = staff.staffCode;
                              String name = staff.fullname;
                              String rank = staff.rank_code;
                              String groupRank = staff.group_work;
                              int month = dropdownValueMonth;
                              int year = 2024;
                              int kyluatlaodong =
                                  int.parse(valueKiLuatLD['id']);
                              int mucdoganket =
                                  int.parse(valueMucDoGanKet['id']);
                              int chatluongTochuc =
                                  int.parse(valueChatLuongToChuc['id']);
                              int mucdoKiemtra =
                                  int.parse(valueMucDoKiemtra['id']);
                              int mucdoHocTap =
                                  int.parse(valueMucDoHocTap['id']);
                              String note = noteController.text;
                              String roomName = staff.roomName;
                              String roomSymbol =
                                  staff.user.roomType.room_symbol;
                              String createdBy = staff.user.username;
                              SelfAsManager item = SelfAsManager(
                                  staffCode: staffCode,
                                  rank: rank,
                                  month: month,
                                  year: year,
                                  kyLuatVaThuong: kyluatlaodong,
                                  ganKetTaoDongLucNv: mucdoganket,
                                  chatLuongToChucPhanCongCv: chatluongTochuc,
                                  ktraGiamSatChuyenMonNv: mucdoKiemtra,
                                  diemMucDoHocTapPt: mucdoHocTap,
                                  roomName: roomName,
                                  name: name,
                                  groupRank: groupRank,
                                  roomSymbol: roomSymbol,
                                  createdBy: createdBy,
                                  note: note);
                              bool result = await ManagerRepo()
                                  .saveSelfAssessManager(item);
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 50),
                                backgroundColor:
                                    Theme.of(context).colorScheme.primary),
                            child: const Text(
                              "Đánh giá",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
