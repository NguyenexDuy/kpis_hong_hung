import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hong_hung_application/api/repository/staff_repo.dart';
import 'package:hong_hung_application/models/result/rs_personal_kpi.dart';
import 'package:hong_hung_application/widgets/dataSources/rs_pesonal_kpi_dataSource.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class ResultPersonalKpi extends StatefulWidget {
  const ResultPersonalKpi({super.key});

  @override
  State<ResultPersonalKpi> createState() => _ResultPersonalKpiState();
}

class _ResultPersonalKpiState extends State<ResultPersonalKpi> {
  Future<List<RsPersonalKpi>>? futureMethod;
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
        futureMethod =
            StaffRepo().getResultPersonalKPI(_selectedMonth!, _selectedYear!);
      });
      setState(() {
        futureMethod =
            StaffRepo().getResultPersonalKPI(_selectedMonth!, _selectedYear!);
      });
    }
    log(_selectedMonth.toString());
    log(_selectedYear.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kết quả KPI cá nhân"),
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
                    "Kết quả KPI cá nhân: ${DateFormat().add_yM().format(_selected!)}"),
            futureMethod == null
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
                    future: futureMethod,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(child: Text("Có lỗi xảy ra"));
                      }
                      List<RsPersonalKpi> mList = snapshot.data!;
                      return SingleChildScrollView(
                        child: PaginatedDataTable(
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
                                  'Họ và tên',
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
                                  'Tập thể đánh giá',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'CS1',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'CS2',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'CS3',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Kết quả KPI tháng',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Tháng/năm',
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
                          ],
                          source: ResultPersonalKpiDataTableSource(mList),
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
