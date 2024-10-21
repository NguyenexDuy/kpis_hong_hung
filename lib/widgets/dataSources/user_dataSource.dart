import 'package:flutter/material.dart';
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
                builder: (context) => EditUserPage(edit: edit),
              ));
        },
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
