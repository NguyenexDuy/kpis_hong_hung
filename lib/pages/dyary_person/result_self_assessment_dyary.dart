import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/manager_repo.dart';
import 'package:hong_hung_application/api/repository/staff_repo.dart';
import 'package:hong_hung_application/models/result/rs_selt_assessment_dyary.dart';

class ResultselfassessmentDyary extends StatefulWidget {
  ResultselfassessmentDyary({super.key, required this.role});
  String role;

  @override
  State<ResultselfassessmentDyary> createState() =>
      _ResultselfassessmentDyaryState();
}

class _ResultselfassessmentDyaryState extends State<ResultselfassessmentDyary> {
  late Future<List<ResultSeltAssessmentDyary_MD>> futureResultSelfAssessment;
  @override
  void initState() {
    super.initState();

    futureResultSelfAssessment = widget.role == "User"
        ? StaffRepo().getSelfAsStaff()
        : ManagerRepo().getSelfAsManager(2, 2024);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kết quả tự đánh giá"),
      ),
      body: FutureBuilder(
          future: futureResultSelfAssessment,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Có lỗi xảy ra"));
            }
            List<ResultSeltAssessmentDyary_MD> mList = snapshot.data!;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'STT',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Mã nhân viên',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Họ tên',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Cấp nhân sự',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Center(
                        child: Text(
                          'Đơn vị',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Tháng đánh giá',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: 100,
                      child: Text(
                        'Kỷ luật lđ và khen thưởng',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: SizedBox(
                      width: 250,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        'Mức độ phối hợp trong hoạt động chuyên môn của khoa phòng',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Chất lượng thực hiện chuyên môn',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Mức độ học tập và phát triển bản thân',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Ghi chú',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
                rows: mList.asMap().entries.map((entry) {
                  int index = entry.key + 1;
                  ResultSeltAssessmentDyary_MD item = entry.value;
                  return DataRow(cells: <DataCell>[
                    DataCell(Text('$index')),
                    DataCell(Center(child: Text(item.staff_code))),
                    DataCell(Text(item.name)),
                    DataCell(Text(item.rank)),
                    DataCell(Text(item.room_name)),
                    DataCell(Text('${item.month}/${item.year}')),
                    DataCell(Text('${item.ky_luat_va_thuong}')),
                    DataCell(Text('${item.muc_do_phoi_hop}')),
                    DataCell(Text('${item.chat_luong_chuyen_mon}')),
                    DataCell(Text('${item.diem_muc_do_hoc_tap_pt}')),
                    DataCell(Text(item.note)),
                  ]);
                }).toList(),
              ),
            );
          }),
    );
  }
}
