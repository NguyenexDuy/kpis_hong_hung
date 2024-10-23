import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/admin_repo.dart';
import 'package:hong_hung_application/models/models/user.dart';
import 'package:hong_hung_application/pages/manager_system/edit_user_page.dart';

class UserDataTableSource extends DataTableSource {
  final bool edit;
  final List<User> users;
  final BuildContext context;

  UserDataTableSource(this.users, this.edit, this.context);

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
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EditUserPage(
                  edit: edit,
                  user: user,
                  rankStaff: user.rankCode,
                  role: user.role[0],
                  roomType: user.roomType,
                  group: user.groupWork,
                ),
              ));
        },
        icon: const Icon(
          Icons.edit_note_sharp,
          color: Colors.blue,
        ),
      )),
      DataCell(IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Reset Password"),
              content:
                  const Text("Bạn có chắc chắn muốn reset password không?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Hủy")),
                TextButton(
                    onPressed: () async {
                      bool result = await AdminRepo().resetPassword(user.id);
                      log("ket qua reset: $result");
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            ),
          );
        },
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
