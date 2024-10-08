import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/models/user.dart';
import 'package:hong_hung_application/pages/manager_system/edit_user_page.dart';
import 'package:hong_hung_application/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserManagerPage extends StatefulWidget {
  const UserManagerPage({super.key});

  @override
  State<UserManagerPage> createState() => _UserManagerPageState();
}

class _UserManagerPageState extends State<UserManagerPage> {
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quản lý User"),
      ),
      body: userProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
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
                            'Id',
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
                            'User Name',
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
                            'Role',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Active',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Edit',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Reset Password',
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
                    source: UserDataTableSource(
                        userProvider.users), // Nguồn dữ liệu
                    rowsPerPage: 50, // Số hàng mỗi trang
                    showFirstLastButtons: true,
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditUserPage(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// DataTableSource để cung cấp dữ liệu cho PaginatedDataTable
class UserDataTableSource extends DataTableSource {
  final List<User> users;

  UserDataTableSource(this.users);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= users.length) return null;
    final User user = users[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(user.id.toString())),
      DataCell(Text(user.fullname)),
      DataCell(Text(user.username)),
      DataCell(Text(user.roomType.room_name)),
      DataCell(Text(user.role[0].roleName)),
      DataCell(Text(user.status.toString())),
      DataCell(IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.edit_note_sharp,
          color: Colors.blue,
        ),
      )),
      DataCell(IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.restore,
          color: Colors.red,
        ),
      )),
      DataCell(Text(user.rankCode.rank_name)),
      DataCell(Text(user.groupWork)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
