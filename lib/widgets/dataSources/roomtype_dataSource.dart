import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/models/room_type.dart';
import 'package:hong_hung_application/pages/manager_system/eidt_room_page.dart';

class RoomTypeDataTableSource extends DataTableSource {
  final List<RoomType> roomTypeList;
  final BuildContext context;
  final bool edit;

  RoomTypeDataTableSource(this.roomTypeList, this.context, this.edit);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= roomTypeList.length) return null;
    final RoomType room = roomTypeList[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(room.room_id.toString())),
      DataCell(Text(room.room_name)),
      DataCell(Text(room.room_symbol)),
      DataCell(Text(room.unique_username)),
      DataCell(Text(room.created_by)),
      DataCell(Text(room.created_at)),
      DataCell(IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EidtRoomPage(
                  edit: edit,
                  roomType: room,
                ),
              ));
        },
        icon: Icon(
          Icons.edit_note_sharp,
          color: Theme.of(context).colorScheme.primary,
        ),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => roomTypeList.length;

  @override
  int get selectedRowCount => 0;
}
