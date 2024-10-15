import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/models/staff_list.dart';
import 'package:hong_hung_application/providers/staff_provider.dart';
import 'package:provider/provider.dart';

class StaffManagerPage extends StatefulWidget {
  const StaffManagerPage({super.key});

  @override
  State<StaffManagerPage> createState() => _StaffManagerPageState();
}

class _StaffManagerPageState extends State<StaffManagerPage> {
  Future<List<StaffList>>? futureMethod;

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<StaffProvider>(context, listen: false);
    provider.fetchStaffList();
  }

  @override
  Widget build(BuildContext context) {
    final staffProvider = Provider.of<StaffProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quản lý Staffs"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text("Xuất file Excel")),
            staffProvider.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
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
                              'Staff code',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Full name',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Email',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Expanded(
                            child: Text(
                              'Room',
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
                              'Nhóm làm việc',
                              style: TextStyle(fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ],
                      rowsPerPage: 50,
                      showFirstLastButtons: true,
                      source: StaffDataSource(staffProvider.staffs),
                    ),
                  )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StaffDataSource extends DataTableSource {
  final List<StaffList> staffs;
  StaffDataSource(this.staffs);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= staffs.length) return null;
    final StaffList itemStaff = staffs[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(index.toString())),
      DataCell(Text(itemStaff.staffCode)),
      DataCell(Text(itemStaff.fullname)),
      DataCell(Text(itemStaff.email)),
      DataCell(Text(itemStaff.roomName)),
      DataCell(Text(itemStaff.rank_code)),
      DataCell(Text(itemStaff.group_work)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => staffs.length;

  @override
  int get selectedRowCount => 0;
}
