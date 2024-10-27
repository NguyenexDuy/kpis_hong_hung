import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hong_hung_application/api/repository/manager_repo.dart';
import 'package:hong_hung_application/models/models/manager_as_member.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class EvaluateDdtKtytHstPage extends StatefulWidget {
  const EvaluateDdtKtytHstPage({super.key});

  @override
  State<EvaluateDdtKtytHstPage> createState() => _EvaluateDdtKtytHstPageState();
}

class _EvaluateDdtKtytHstPageState extends State<EvaluateDdtKtytHstPage> {
  Future<List<ManagerAsMember>>? futureMethod;
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
        futureMethod = ManagerRepo()
            .managerCaptainAssessment(_selectedMonth!, _selectedYear!);
      });
      setState(() {
        futureMethod = ManagerRepo()
            .managerCaptainAssessment(_selectedMonth!, _selectedYear!);
      });
    }
    log(_selectedMonth.toString());
    log(_selectedYear.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đánh giá phó khoa/phòng hoặc ĐDT/KTYT/HST"),
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
                    "Kết quả đánh giá phó khoa/phòng hoặc ĐDT/KTYT/HST  ${DateFormat().add_yM().format(_selected!)}"),
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
                      List<ManagerAsMember> managerAsMember = snapshot.data!;
                      return PaginatedDataTable(
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Staff code',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Full Name',
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
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Action',
                                style: TextStyle(fontStyle: FontStyle.italic),
                              ),
                            ),
                          ),
                        ],
                        source: ManagerAsMemberDataTableSource(
                            managerAsMember, context),
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
class ManagerAsMemberDataTableSource extends DataTableSource {
  final List<ManagerAsMember> managerAsMemberList;
  final BuildContext context;

  ManagerAsMemberDataTableSource(this.managerAsMemberList, this.context);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= managerAsMemberList.length) return null;
    final ManagerAsMember managerItem = managerAsMemberList[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(managerItem.staffCode!)),
      DataCell(Text(managerItem.memberName!)),
      DataCell(Text(managerItem.username!.rankCode.rank_name)),
      DataCell(IconButton(
        icon: const Icon(Icons.ac_unit),
        onPressed: () {},
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => managerAsMemberList.length;

  @override
  int get selectedRowCount => 0;
}
