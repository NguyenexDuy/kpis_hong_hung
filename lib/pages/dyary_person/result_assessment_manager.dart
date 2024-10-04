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
                  "Kết quả đánh giá cấp nhân viên  ${DateFormat().add_yM().format(_selected!)}"),
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
                              DataCell(Text(
                                  item.gan_ket_tao_dong_luc_nv.toString())),
                              DataCell(Text(item.chat_luong_to_chuc_phan_cong_cv
                                  .toString())),
                              DataCell(Text(item.assessed_by)),
                              DataCell(Text(item.position)),
                              DataCell(Text("${item.month}/${item.year}")),
                              DataCell(Text(item.note_desc)),
                            ]);
                          }).toList()),
                    );
                  },
                ),
        ]));
  }
}
