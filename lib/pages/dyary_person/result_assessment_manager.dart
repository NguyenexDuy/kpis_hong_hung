import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/manager_repo.dart';
import 'package:hong_hung_application/models/result/rs_member_as_manager.dart';

class ResultAssessmentManager extends StatefulWidget {
  const ResultAssessmentManager({super.key});

  @override
  State<ResultAssessmentManager> createState() =>
      _ResultAssessmentManagerState();
}

class _ResultAssessmentManagerState extends State<ResultAssessmentManager> {
  late Future<List<RsMemberAsManager>> futureMemberAsManager;

  @override
  void initState() {
    super.initState();
    futureMemberAsManager = ManagerRepo().getResultMemberAssessManager(1, 2024);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kết quả đánh giá cấp quản lý"),
      ),
      body: FutureBuilder(
        future: futureMemberAsManager,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Có lỗi xảy ra"));
          }
          List<RsMemberAsManager> mlist = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columns: const <DataColumn>[
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Mã NV',
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
                        'Cấp bậc',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Gắn kết vào tạo động lực cho nhân viên',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Chất lượng tổ chức phân công công việc',
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
                        'Cấp bậc  ',
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
                        'Ghi chú',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
                rows: mlist.asMap().entries.map((enty) {
                  RsMemberAsManager item = enty.value;
                  return DataRow(cells: <DataCell>[
                    DataCell(Text(item.staff_code)),
                    DataCell(Text(item.manager_name)),
                    DataCell(Text(item.rank_manager)),
                    DataCell(Text(item.gan_ket_tao_dong_luc_nv.toString())),
                    DataCell(
                        Text(item.chat_luong_to_chuc_phan_cong_cv.toString())),
                    DataCell(Text(item.assessed_by)),
                    DataCell(Text(item.position)),
                    DataCell(Text("${item.month}/${item.year}")),
                    DataCell(Text(item.note_desc)),
                  ]);
                }).toList()),
          );
        },
      ),
    );
  }
}
