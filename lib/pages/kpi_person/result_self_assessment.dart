import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/staff_repo.dart';
import 'package:hong_hung_application/models/result/rs_selt_assessment_dyary.dart';
import 'package:hong_hung_application/widgets/dataSources/rs_assessment_dataSource.dart';

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
              source: ResultAssessmentDataSource(listRsSefl),
              rowsPerPage: 20,
              showFirstLastButtons: true,
            ),
          );
        },
      ),
    );
  }
}
