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
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
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
                      rows: staffProvider.staffs.asMap().entries.map((enty) {
                        StaffList staff = enty.value;
                        int index = enty.key + 1;
                        return DataRow(cells: <DataCell>[
                          DataCell(Text(index.toString())),
                          DataCell(Text(staff.staffCode)),
                          DataCell(Text(staff.fullname)),
                          DataCell(Text(staff.email)),
                          DataCell(Text(staff.roomName)),
                          DataCell(Text(staff.rank_code)),
                          DataCell(Text(staff.group_work)),
                        ]);
                      }).toList(),
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
