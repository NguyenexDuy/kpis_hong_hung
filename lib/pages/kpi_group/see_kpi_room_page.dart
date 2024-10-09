import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/room_repo.dart';
import 'package:hong_hung_application/models/models/name_list_kpi.dart';
import 'package:month_year_picker/month_year_picker.dart';

class SeeKpiRoomPage extends StatefulWidget {
  const SeeKpiRoomPage({super.key});

  @override
  State<SeeKpiRoomPage> createState() => _SeeKpiRoomPageState();
}

class _SeeKpiRoomPageState extends State<SeeKpiRoomPage> {
  Future<List<NameListKpi>>? futureMethod;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureMethod = RoomRepo().getAllListKpi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xem chỉ số KPI các Khoa/Phòng"),
      ),
      body: FutureBuilder(
        future: futureMethod,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text("Có lỗi xảy ra"));
          }
          List<NameListKpi> listKPI = snapshot.data!;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                    onPressed: () {}, child: const Text("Xuất file Excel")),
                PaginatedDataTable(
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
                          'Tên chỉ số',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Phòng chịu trách nhiệm',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Phòng báo cáo',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Tần suất báo cáo',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Kiểu so sánh',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Chỉ tiêu',
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
                  source: NameKPIDataTableSource(listKPI), // Nguồn dữ liệu
                  rowsPerPage: 20, // Số hàng mỗi trang
                  showFirstLastButtons: true,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// DataTableSource để cung cấp dữ liệu cho PaginatedDataTable
class NameKPIDataTableSource extends DataTableSource {
  final List<NameListKpi> nameListKPI;

  NameKPIDataTableSource(this.nameListKPI);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= nameListKPI.length) return null;
    final NameListKpi kpiItem = nameListKPI[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(kpiItem.kpiName)),
      DataCell(Text(kpiItem.roomResponsibleSymbol)),
      DataCell(Text(kpiItem.roomReportSymbol)),
      DataCell(Text(kpiItem.kpiType)),
      DataCell(Text(kpiItem.compareType)),
      DataCell(Text(kpiItem.note.toString())),
      DataCell(Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit_note_sharp)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.check_circle_outline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline)),
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
