import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hong_hung_application/api/repository/manager_repo.dart';
import 'package:hong_hung_application/models/result/rs_manager_as_member.dart';
import 'package:hong_hung_application/widgets/dataSources/rs_assessment_dataSource.dart';
import 'package:hong_hung_application/widgets/dataSources/rs_manager_as_member_dataSource.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class ResultManagerAsMemberPage extends StatefulWidget {
  const ResultManagerAsMemberPage({super.key});

  @override
  State<ResultManagerAsMemberPage> createState() =>
      _ResultManagerAsMemberPageState();
}

class _ResultManagerAsMemberPageState extends State<ResultManagerAsMemberPage> {
  Future<List<RsManagerAsMember>>? futureMethod;
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
            .getResultManagerAssessMember(_selectedMonth!, _selectedYear!);
      });
      setState(() {
        futureMethod = ManagerRepo()
            .getResultManagerAssessMember(_selectedMonth!, _selectedYear!);
      });
    }
    log(_selectedMonth.toString());
    log(_selectedYear.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kết quả quản lý đánh giá nhân viên"),
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
                      List<RsManagerAsMember> mList = snapshot.data!;
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
                                  'Tháng/năm',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Họ tên quản lý',
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
                                  'Tập thể đánh giá',
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
                          source: ResultManagerAsMemberDataSource(mList),
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
