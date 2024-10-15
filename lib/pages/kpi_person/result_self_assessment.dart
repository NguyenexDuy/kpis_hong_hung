import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/staff_repo.dart';
import 'package:hong_hung_application/models/result/rs_selt_assessment_dyary.dart';

class ResultSelfAssessment extends StatefulWidget {
  const ResultSelfAssessment({super.key});

  @override
  State<ResultSelfAssessment> createState() => _ResultSelfAssessmentState();
}

class _ResultSelfAssessmentState extends State<ResultSelfAssessment> {
  Future<List<ResultSeltAssessmentDyary_MD>>? futureMethod;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureMethod = StaffRepo().getSelfAsStaff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kết quả tự đánh giá"),
      ),
      body: FutureBuilder(
        future: futureMethod,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Có lỗi xảy ra"));
          }

          List<ResultSeltAssessmentDyary_MD> listRsSefl = snapshot.data!;
          return SingleChildScrollView(
            child: PaginatedDataTable(
              header: TextField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors
                            .grey[400]!, // Màu viền khi ô không nhận focus
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Màu viền khi ô nhận focus
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Tìm kiếm",
                    hintStyle: const TextStyle(color: Colors.grey)),
              ),
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
                      'Họ tên',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Cấp nhân sự  ',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Đơn vị',
                      style: TextStyle(fontStyle: FontStyle.italic),
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
                  label: Expanded(
                    child: Text(
                      'Kỉ luật lao động và khen thưởng',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Mức độ phối hợp trong hoạt động chuyên môn của khoa/phòng',
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
                      'Chất lượng thực hiện chuyên môn',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                DataColumn(
                  label: Expanded(
                    child: Text(
                      'Mức độ học tập và pt bản thân',
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
              source: ResultAssessment(listRsSefl),
              rowsPerPage: 20,
              showFirstLastButtons: true,
            ),
          );
        },
      ),
    );
  }
}

// DataTableSource để cung cấp dữ liệu cho PaginatedDataTable
class ResultAssessment extends DataTableSource {
  final List<ResultSeltAssessmentDyary_MD> listRs;

  ResultAssessment(this.listRs);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= listRs.length) return null;
    final ResultSeltAssessmentDyary_MD rs = listRs[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(rs.staff_code)),
      DataCell(Text(rs.name)),
      DataCell(Text(rs.rank)),
      DataCell(Text(rs.room_name)),
      DataCell(Text(rs.created_at)),
      DataCell(Text(rs.ky_luat_va_thuong.toString())),
      DataCell(Text(rs.muc_do_phoi_hop.toString())),
      DataCell(Text(rs.chat_luong_chuyen_mon.toString())),
      DataCell(Text(rs.diem_muc_do_hoc_tap_pt.toString())),
      DataCell(Text(rs.note)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => listRs.length;

  @override
  int get selectedRowCount => 0;
}
