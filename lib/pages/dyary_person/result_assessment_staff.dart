import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/staff_repo.dart';
import 'package:hong_hung_application/models/result/rs_member_assess.dart';

class ResultAssessmentStaff extends StatefulWidget {
  const ResultAssessmentStaff({super.key});

  @override
  State<ResultAssessmentStaff> createState() => _ResultAssessmentStaffState();
}

class _ResultAssessmentStaffState extends State<ResultAssessmentStaff> {
  late Future<List<RsMemberAssess>> mlist;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mlist = GetSelfAsStaffRepo().getMemberAssess(1, 2024);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kết quả đánh giá cấp nhân viên"),
      ),
      body: FutureBuilder(
        future: mlist,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Có lỗi xảy ra"));
          }
          List<RsMemberAssess> mList = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const <DataColumn>[
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
                      'Nhân viên được đánh giá',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Mức độ phối hợp hoạt động chuyên môn',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Người đánh giá',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Tháng/Năm',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Ý kiến đánh giá',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
              rows: mList.asMap().entries.map((entry) {
                RsMemberAssess item = entry.value;
                return DataRow(cells: <DataCell>[
                  DataCell(Text(item.staffCode.toString())),
                  DataCell(Text(item.memberName)),
                  DataCell(Text(item.markMemberAssess.toString())),
                  DataCell(Text(item.assessedBy)),
                  DataCell(Text("${item.month}/${item.year}")),
                  DataCell(Text(item.noteDesc)),
                ]);
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
