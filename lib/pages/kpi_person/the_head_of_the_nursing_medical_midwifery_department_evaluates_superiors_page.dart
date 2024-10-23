import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hong_hung_application/api/repository/staff_repo.dart';
import 'package:hong_hung_application/models/models/member_assessment.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class TheHeadOfTheNursingMedicalMidwiferyDepartmentEvaluatesSuperiorsPage
    extends StatefulWidget {
  const TheHeadOfTheNursingMedicalMidwiferyDepartmentEvaluatesSuperiorsPage(
      {super.key});

  @override
  State<TheHeadOfTheNursingMedicalMidwiferyDepartmentEvaluatesSuperiorsPage>
      createState() =>
          _TheHeadOfTheNursingMedicalMidwiferyDepartmentEvaluatesSuperiorsPageState();
}

class _TheHeadOfTheNursingMedicalMidwiferyDepartmentEvaluatesSuperiorsPageState
    extends State<
        TheHeadOfTheNursingMedicalMidwiferyDepartmentEvaluatesSuperiorsPage> {
  Future<List<MemberAssessment>>? futureMethod;
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
        futureMethod = StaffRepo()
            .memberAssessmentManager(_selectedMonth!, _selectedYear!);
      });
      setState(() {
        futureMethod = StaffRepo()
            .memberAssessmentManager(_selectedMonth!, _selectedYear!);
      });
    }
    log(_selectedMonth.toString());
    log(_selectedYear.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("Điều dưỡng/KTY/Hộ sinh trưởng khoa đánh giá cấp trên"),
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
                    "Kết quả đánh giá điều dưỡng/KTY/Hộ sinh trưởng khoa đánh giá cấp trên  ${DateFormat().add_yM().format(_selected!)}"),
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
                      List<MemberAssessment> managerAsMember = snapshot.data!;
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
  final List<MemberAssessment> managerAsMemberList;
  final BuildContext context;

  ManagerAsMemberDataTableSource(this.managerAsMemberList, this.context);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= managerAsMemberList.length) return null;
    final MemberAssessment managerItem = managerAsMemberList[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(managerItem.staffCode!)),
      DataCell(Text(managerItem.memberName!)),
      DataCell(Text(managerItem.username!.rankCode.rank_name)),
      DataCell(IconButton(
        icon: Icon(
          Icons.edit_note_sharp,
          color: Theme.of(context).colorScheme.primary,
        ),
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
