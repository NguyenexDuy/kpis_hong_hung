import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/staff_repo.dart';
import 'package:hong_hung_application/models/result/rs_manager_as_yourself.dart';

class SeeSuperiorsReviews extends StatefulWidget {
  const SeeSuperiorsReviews({super.key});

  @override
  State<SeeSuperiorsReviews> createState() => _SeeSuperiorsReviewsState();
}

class _SeeSuperiorsReviewsState extends State<SeeSuperiorsReviews> {
  late Future<List<RsManagerAsYourself>> mlist;

  @override
  void initState() {
    super.initState();
    mlist = GetSelfAsStaffRepo().getResultManagerAsYourself();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xem cấp trên đánh giá"),
      ),
      body: FutureBuilder(
        future: mlist,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Có lỗi xảy ra"));
          }
          List<RsManagerAsYourself> listRS = snapshot.data!;
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
                        'Quản lý trực tiếp',
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
                        'Người được đánh giá',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Kỷ luật lao động và khen thưởng',
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
                        'Bằng chứng học tập và phát triển bản thân',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Expanded(
                      child: Text(
                        'Nhận xét',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ],
                rows: listRS.asMap().entries.map((entry) {
                  int index = entry.key + 1;
                  RsManagerAsYourself item = entry.value;
                  return DataRow(cells: <DataCell>[
                    DataCell(Text('$index')),
                    DataCell(Text(item.assessedBy)),
                    DataCell(Text("${item.month}/${item.year}")),
                    DataCell(Text(item.memberName)),
                    DataCell(Text(item.kyLuatKhenThuongMember.toString())),
                    DataCell(Text(item.chatLuongChuyenMonMember.toString())),
                    DataCell(Text(item.bangChungHocTapPtMember.toString())),
                    DataCell(Text(item.managerEvaluateCmt)),
                  ]);
                }).toList()),
          );
        },
      ),
    );
  }
}
