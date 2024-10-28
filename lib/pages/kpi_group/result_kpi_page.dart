import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hong_hung_application/api/repository/room_repo.dart';
import 'package:hong_hung_application/models/models/kpi_room_data.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class ResultKpi extends StatefulWidget {
  const ResultKpi({super.key});

  @override
  State<ResultKpi> createState() => _ResultKpiState();
}

class _ResultKpiState extends State<ResultKpi> {
  Future<List<KpiRoomData>>? futureMethod;
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
            RoomRepo().getAllKPIRoomData(_selectedMonth!, _selectedYear!);
      });
      setState(() {
        futureMethod =
            RoomRepo().getAllKPIRoomData(_selectedMonth!, _selectedYear!);
      });
    }
    log(_selectedMonth.toString());
    log(_selectedYear.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kết quả KPI Khoa/Phòng phụ trách"),
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
                    "Kết quả KPI khoa/phòng phụ trách  ${DateFormat().add_yM().format(_selected!)}"),
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
                      List<KpiRoomData> listKPI = snapshot.data!;
                      return Column(
                        children: [
                          ElevatedButton(
                              onPressed: () {},
                              child: const Text("Xuất file Excel")),
                          PaginatedDataTable(
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
                                    'Tháng/Năm',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Tên CS',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Phòng chịu trách nhiệm',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Phòng báo cáo',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Chỉ tiêu tháng',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Giá trị số cho chỉ tiêu tháng',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'So sánh',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Tử số',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Mẫu số',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Người nhập liệu',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Điểm hiệu chỉnh',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Kết quả chỉ số',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Kết quả KPI',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Action',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                            source: NameKPIDataTableSource(
                                listKPI), // Nguồn dữ liệu
                            rowsPerPage: 20, // Số hàng mỗi trang
                            showFirstLastButtons: true,
                          ),
                        ],
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}

// DataTableSource để cung cấp dữ liệu cho PaginatedDataTable
class NameKPIDataTableSource extends DataTableSource {
  final List<KpiRoomData> nameListKPI;

  NameKPIDataTableSource(this.nameListKPI);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= nameListKPI.length) return null;
    final KpiRoomData kpiItem = nameListKPI[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(kpiItem.createdAt.toString())),
      DataCell(Text(kpiItem.kpiName)),
      DataCell(Text(kpiItem.kpiNameId!.roomResponsibleSymbol)),
      DataCell(Text(kpiItem.kpiNameId!.roomReportSymbol)),
      DataCell(Text(kpiItem.kpiNameId!.note.toString())),
      DataCell(Text(kpiItem.chiTieu.toString())),
      DataCell(Text(kpiItem.kpiNameId!.compareType)),
      DataCell(Text(kpiItem.tsThucHien.toString())),
      DataCell(Text(kpiItem.msChung.toString())),
      DataCell(Text(kpiItem.username!.fullname)),
      DataCell(Text(kpiItem.diemHieuChinh.toString())),
      DataCell(Text(kpiItem.kqCs.toString())),
      DataCell(Text(kpiItem.kqKpi.toString())),
      DataCell(Row(
        children: [
          IconButton(
            icon: const Icon(Icons.edit_calendar_sharp),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline_sharp),
            onPressed: () {},
          )
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => nameListKPI.length;

  @override
  int get selectedRowCount => 0;
}
