import 'package:flutter/material.dart';
import 'package:hong_hung_application/const.dart';
import 'package:hong_hung_application/models/models/name_list_kpi.dart';
import 'package:hong_hung_application/widgets/dropdown_button_style_string.dart';

class EditKpiRoomPage extends StatefulWidget {
  const EditKpiRoomPage({super.key, required this.nameListKpi});
  final NameListKpi nameListKpi;

  @override
  State<EditKpiRoomPage> createState() => _EditKpiRoomPageState();
}

class _EditKpiRoomPageState extends State<EditKpiRoomPage> {
  TextEditingController phongBaoCao = TextEditingController();
  TextEditingController phongChiuTrachNhiem = TextEditingController();
  TextEditingController chiSoKpiBaoCao = TextEditingController();
  TextEditingController chiTieu = TextEditingController();
  String dropDownCompare = compareList.first;
  String dropDownCompareType = compareTypeList.first;

  @override
  void initState() {
    super.initState();
    phongBaoCao.text = "Phòng dịch vụ khách hàng";
    phongChiuTrachNhiem.text = "Phòng Ăn Chơi";
    chiSoKpiBaoCao.text = "Hài lòng về mức độ ăn chơi";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chỉnh sửa KPI room"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: phongBaoCao,
              decoration: InputDecoration(
                  enabled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                      width: 2.0,
                    ),
                  ),
                  labelText: "Phòng báo cáo",
                  labelStyle: TextStyle(color: Colors.grey[400])),
            ),
            TextFormField(
              controller: phongChiuTrachNhiem,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                      width: 2.0,
                    ),
                  ),
                  enabled: false,
                  labelText: "Phòng chịu trách nhiệm",
                  labelStyle: TextStyle(color: Colors.grey[400])),
            ),
            TextFormField(
              controller: chiSoKpiBaoCao,
              decoration: InputDecoration(
                  enabled: false,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                      width: 2.0,
                    ),
                  ),
                  labelText: "Chỉ số KPI để báo cáo",
                  labelStyle: TextStyle(color: Colors.grey[400])),
            ),
            DropdownButtonStyleString(
              title: "Loại KPI",
              mlist: compareList,
              dropDownValue: dropDownCompare,
              onChanged: (p0) {
                dropDownCompare = p0;
              },
            ),
            DropdownButtonStyleString(
              title: "Kiểu so sánh",
              mlist: compareTypeList,
              dropDownValue: dropDownCompareType,
              onChanged: (p0) {
                dropDownCompare = p0;
              },
            ),
            TextFormField(
              controller: chiTieu,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                      width: 2.0,
                    ),
                  ),
                  labelText: "Chỉ tiêu",
                  labelStyle: TextStyle(color: Colors.grey[400])),
            ),
          ],
        ),
      ),
    );
  }
}
