import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hong_hung_application/api/repository/manager_repo.dart';
import 'package:hong_hung_application/models/result/rs_leader_as_manager.dart';
import 'package:hong_hung_application/widgets/dataSources/rs_leader_as_manager_dataSource.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';

class ResultLeaderAsManagerPage extends StatefulWidget {
  const ResultLeaderAsManagerPage({super.key});

  @override
  State<ResultLeaderAsManagerPage> createState() =>
      _ResultLeaderAsManagerPageState();
}

class _ResultLeaderAsManagerPageState extends State<ResultLeaderAsManagerPage> {
  Future<List<RsLeaderAsManager>>? futureMethod;
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
            .getResultLeaderAssessManager(_selectedMonth!, _selectedYear!);
      });
      setState(() {
        futureMethod = ManagerRepo()
            .getResultLeaderAssessManager(_selectedMonth!, _selectedYear!);
      });
    }
    log(_selectedMonth.toString());
    log(_selectedYear.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kết quả đánh giá lãnh đạo"),
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
                    "Kết quả đánh giá lãnh đạo  ${DateFormat().add_yM().format(_selected!)}"),
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

                      List<RsLeaderAsManager> mlist = snapshot.data!;
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
                                  'Quản lý trực tiếp',
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
                                  'Người được đánh giá',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Center(
                                  child: Text(
                                    'Kỷ luật lao động và khen thưởng',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Expanded(
                                child: Text(
                                  'Mức độ kiểm tra, giám sát thực hiện chuyên môn của nv khoa/phòng',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 100,
                                child: Text(
                                  'Bằng chứng học tập và phát triển bản thân',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: SizedBox(
                                width: 250,
                                child: Text(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  'Nhận xét',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                          ],
                          source: RsLeaderAsManagerDataSource(mlist),
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
