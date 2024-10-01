import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hong_hung_application/api/repository/manager_repo.dart';
import 'package:hong_hung_application/models/result/rs_member_assess.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class ResultOpinionStaffPage extends StatefulWidget {
  const ResultOpinionStaffPage({super.key});

  @override
  State<ResultOpinionStaffPage> createState() => _ResultOpinionStaffPageState();
}

class _ResultOpinionStaffPageState extends State<ResultOpinionStaffPage> {
  Future<List<RsMemberAssess>>? mlist;
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
        mlist = ManagerRepo()
            .getResultMemberOpinion(_selectedMonth!, _selectedYear!);
      });
      setState(() {
        mlist = ManagerRepo()
            .getResultMemberOpinion(_selectedMonth!, _selectedYear!);
      });
    }
    log(_selectedMonth.toString());
    log(_selectedYear.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ý kiến nhân viên đánh giá lẫn nhau"),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          TextButton(
            child: const Text('Chọn thời gian xem'),
            onPressed: () async => _onPressed(context: context),
          ),
          _selected == null
              ? const Center(child: Text('Bạn chưa chọn thời gian'))
              : Text(
                  "Ý kiến nhân viên đánh giá lẫn nhau  ${DateFormat().add_yM().format(_selected!)}"),
          mlist == null
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
                                'Người được đánh giá',
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
                                'Khoa/phòng',
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
                            DataCell(Text(item.position)),
                            DataCell(Text(item.roomName)),
                            DataCell(Text(item.createdAt)),
                            DataCell(Text(item.noteDesc)),
                          ]);
                        }).toList(),
                      ),
                    );
                  },
                ),
        ]));
  }
}
