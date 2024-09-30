import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hong_hung_application/api/repository/staff_repo.dart';
import 'package:hong_hung_application/models/result/rs_selt_assessment_dyary.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class ResultSelfAsStaffPage extends StatefulWidget {
  const ResultSelfAsStaffPage({super.key});

  @override
  State<ResultSelfAsStaffPage> createState() => _ResultSelfAsStaffPageState();
}

class _ResultSelfAsStaffPageState extends State<ResultSelfAsStaffPage> {
  Future<List<ResultSeltAssessmentDyary_MD>>? futureSelfAsStaff;
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
        futureSelfAsStaff = StaffRepo()
            .getResultSelfAssessStaff(_selectedMonth!, _selectedYear!);
      });
      setState(() {
        futureSelfAsStaff = StaffRepo()
            .getResultSelfAssessStaff(_selectedMonth!, _selectedYear!);
      });
    }
    log(_selectedMonth.toString());
    log(_selectedYear.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kết quả nhân viên tự đánh giá"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
              child: const Text('Chọn thời gian xem'),
              onPressed: () async => _onPressed(context: context),
            ),
            _selected == null
                ? const Center(child: Text('Bạn chưa chọn thời gian'))
                : Text(
                    "Kết quả đánh giá cấp nhân viên  ${DateFormat().add_yM().format(_selected!)}"),
            futureSelfAsStaff == null
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
                    future: futureSelfAsStaff,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(child: Text("Có lỗi xảy ra"));
                      }

                      List<ResultSeltAssessmentDyary_MD> mlist = snapshot.data!;
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                            columns: const <DataColumn>[
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'STT',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Mã nhân viên',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Họ tên',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Cấp nhân sự',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Center(
                                    child: Text(
                                      'Đơn vị',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic),
                                    ),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Tháng đánh giá',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
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
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
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
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Chất lượng thực hiện chuyên môn',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Mức độ học tập và phát triển bản thân',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Ghi chú',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                            rows: mlist.asMap().entries.map((enty) {
                              int index = enty.key + 1;
                              ResultSeltAssessmentDyary_MD item = enty.value;
                              return DataRow(cells: <DataCell>[
                                DataCell(Text('$index')),
                                DataCell(Text(item.staff_code)),
                                DataCell(Text(item.name)),
                                DataCell(Text(item.rank)),
                                DataCell(Text(item.room_name)),
                                DataCell(Text(item.created_at)),
                                DataCell(
                                    Text(item.ky_luat_va_thuong.toString())),
                                DataCell(Text(item.muc_do_phoi_hop.toString())),
                                DataCell(Text(
                                    item.chat_luong_chuyen_mon.toString())),
                                DataCell(Text(
                                    item.diem_muc_do_hoc_tap_pt.toString())),
                                DataCell(Text(item.note.toString())),
                              ]);
                            }).toList()),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
