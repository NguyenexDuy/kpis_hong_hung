import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hong_hung_application/api/repository/manager_repo.dart';
import 'package:hong_hung_application/models/result/rs_member_as_manager.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class ResultAssessmentManager extends StatefulWidget {
  const ResultAssessmentManager({super.key});

  @override
  State<ResultAssessmentManager> createState() =>
      _ResultAssessmentManagerState();
}

class _ResultAssessmentManagerState extends State<ResultAssessmentManager> {
  Future<List<RsMemberAsManager>>? futureMemberAsManager;
  int? _selectedMonth;
  int? _selectedYear;
  DateTime? _selected;

  Future<void> _onPressed({
    required BuildContext context,
    String? locale,
  }) async {
    final localeObj = locale != null ? Locale(locale) : null;
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: _selected ?? DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2050),
      locale: localeObj,
    );
    if (selected != null) {
      setState(() {
        _selected = selected;
        _selectedMonth = _selected!.month;
        _selectedYear = _selected!.year;
        futureMemberAsManager = ManagerRepo()
            .getResultMemberAssessManager(_selectedMonth!, _selectedYear!);
      });
      setState(() {
        futureMemberAsManager = ManagerRepo()
            .getResultMemberAssessManager(_selectedMonth!, _selectedYear!);
      });
    }
    log(_selectedMonth.toString());
    log(_selectedYear.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kết quả đánh giá cấp quản lý"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          TextButton(
            child: const Text('Chọn thời gian xem'),
            onPressed: () async => _onPressed(context: context),
          ),
          _selected == null
              ? const Center(child: Text('Bạn chưa chọn thời gian'))
              : Text(
                  "Kết quả đánh giá cấp quản lý  ${DateFormat().add_yM().format(_selected!)}"),
          futureMemberAsManager == null
              ? Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                          "Vui lòng chọn thời gian để xem kết quả đánh giá"),
                    ),
                    SvgPicture.asset(
                      "assets/svg/search.svg",
                      width: 300,
                    )
                  ],
                )
              : FutureBuilder(
                  future: futureMemberAsManager,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return const Center(child: Text("Có lỗi xảy ra"));
                    }
                    List<RsMemberAsManager> mlist = snapshot.data!;
                    return SingleChildScrollView(
                      child: PaginatedDataTable(
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
                        source: RsAssessmentManagerDataTableSource(mlist),
                      ),
                    );
                  },
                ),
        ]));
  }
}

class RsAssessmentManagerDataTableSource extends DataTableSource {
  RsAssessmentManagerDataTableSource(this.rsList);
  final List<RsMemberAsManager> rsList;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= rsList.length) return null;
    final RsMemberAsManager rsItem = rsList[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(rsItem.staff_code)),
      DataCell(Text(rsItem.manager_name)),
      DataCell(Text(rsItem.rank_manager)),
      DataCell(Text(rsItem.gan_ket_tao_dong_luc_nv.toString())),
      DataCell(Text(rsItem.chat_luong_to_chuc_phan_cong_cv.toString())),
      DataCell(Text(rsItem.assessed_by)),
      DataCell(Text(rsItem.position)),
      DataCell(Text("${rsItem.month}/${rsItem.year}")),
      DataCell(Text(rsItem.note_desc)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rsList.length;

  @override
  int get selectedRowCount => 0;
}
