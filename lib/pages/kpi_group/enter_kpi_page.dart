import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hong_hung_application/api/repository/room_repo.dart';
import 'package:hong_hung_application/models/models/kpi_room_data.dart';
import 'package:hong_hung_application/pages/kpi_person/nhaplieu_kpi_khoa_phong_page.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class EnterKpi extends StatefulWidget {
  const EnterKpi({super.key});

  @override
  State<EnterKpi> createState() => _EnterKpiState();
}

class _EnterKpiState extends State<EnterKpi> {
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
        futureMethod = RoomRepo().enterKPI(_selectedMonth!, _selectedYear!);
      });
      setState(() {
        futureMethod = RoomRepo().enterKPI(_selectedMonth!, _selectedYear!);
      });
    }
    log(_selectedMonth.toString());
    log(_selectedYear.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nhập số liệu KPI cho Khoa/Phòng"),
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
                                    'Mã chỉ tiêu',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Tên chỉ số',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Chỉ tiêu tháng ',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Loại',
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
                                    'Mã Khoa/Phòng',
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
                                    'Mã Khoa/Phòng',
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
                                listKPI, context), // Nguồn dữ liệu
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
  final BuildContext context;

  NameKPIDataTableSource(this.nameListKPI, this.context);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= nameListKPI.length) return null;
    final KpiRoomData kpiItem = nameListKPI[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(kpiItem.id.toString())),
      DataCell(Text(kpiItem.kpiName)),
      DataCell(Text(kpiItem.goal.toString())),
      DataCell(Text(kpiItem.kpiType)),
      DataCell(Text(kpiItem.roomResponsible!)),
      DataCell(Text(kpiItem.roomResponsibleSymbol)),
      DataCell(Text(kpiItem.roomReport!)),
      DataCell(Text(kpiItem.roomResponsibleSymbol)),
      DataCell(IconButton(
        icon: Icon(
          Icons.edit_note_sharp,
          color: Theme.of(context).colorScheme.primary,
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NhaplieuKpiKhoaPhongPage(),
              ));
        },
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
