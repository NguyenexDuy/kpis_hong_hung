import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/models/user.dart';
import 'package:hong_hung_application/pages/manager_system/edit_user_page.dart';
import 'package:hong_hung_application/providers/user_provider.dart';
import 'package:hong_hung_application/widgets/dataSources/user_dataSource.dart';
import 'package:provider/provider.dart';

class UserManagerPage extends StatefulWidget {
  const UserManagerPage({super.key});

  @override
  State<UserManagerPage> createState() => _UserManagerPageState();
}

class _UserManagerPageState extends State<UserManagerPage> {
  TextEditingController searchController = TextEditingController();
  List<User>? filteredUsers;
  bool edit = true;
  @override
  void initState() {
    super.initState();

    final provider = Provider.of<UserProvider>(context, listen: false);
    provider.fetchUsers().then((_) {
      setState(() {
        filteredUsers =
            provider.users; // Gán dữ liệu gốc ban đầu vào filteredUsers
      });
    });
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
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                      ),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 13)),
                          onPressed: () {},
                          child: const Text(
                            "Xuất file Excel",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    PaginatedDataTable(
                      header: TextField(
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Colors.grey[
                                    400]!, // Màu viền khi ô không nhận focus
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primary, // Màu viền khi ô nhận focus
                                width: 2.0,
                              ),
                            ),
                            prefixIcon: const Icon(Icons.search),
                            hintText: "Tìm kiếm",
                            hintStyle: const TextStyle(color: Colors.grey)),
                        controller: searchController,
                        onChanged: (value) {
                          setState(() {
                            if (value.isEmpty) {
                              userProvider.users = filteredUsers!;
                            } else {
                              userProvider.users = filteredUsers!
                                  .where((user) =>
                                      user.fullname
                                          .toLowerCase()
                                          .contains(value.toLowerCase()) ||
                                      user.username
                                          .toLowerCase()
                                          .contains(value.toLowerCase()) ||
                                      user.groupWork
                                          .toLowerCase()
                                          .contains(value.toLowerCase()))
                                  .toList();
                            }
                          });
                        },
                      ),
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
                          userProvider.users, edit, context),
                      rowsPerPage: 50,
                      showFirstLastButtons: true,
                    ),
                  ],
                ),
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            edit = false;
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditUserPage(
                  edit: edit,
                ),
              ),
            );

            if (result == true) {
              Provider.of<UserProvider>(context, listen: false).fetchUsers();
            }
          },
          child: const Icon(Icons.add),
        ));
  }
}
