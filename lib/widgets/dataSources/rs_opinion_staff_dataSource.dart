import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/result/rs_member_assess.dart';

class RsMemberAssessDataSource extends DataTableSource {
  final List<RsMemberAssess> listRs;

  RsMemberAssessDataSource(this.listRs);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= listRs.length) return null;
    final RsMemberAssess item = listRs[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(item.staffCode.toString())),
      DataCell(Text(item.memberName)),
      DataCell(Text(item.position)),
      DataCell(Text(item.roomName)),
      DataCell(Text(item.createdAt)),
      DataCell(Text(item.noteDesc)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => listRs.length;

  @override
  int get selectedRowCount => 0;
}
