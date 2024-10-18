import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/result/rs_manager_as_yourself.dart';

class RsManagerAsYourselfDataTableSource extends DataTableSource {
  RsManagerAsYourselfDataTableSource(this.rsList);
  final List<RsManagerAsYourself> rsList;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= rsList.length) return null;
    final RsManagerAsYourself item = rsList[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('${index + 1}')),
      DataCell(Text(item.assessedBy)),
      DataCell(Text("${item.month}/${item.year}")),
      DataCell(Text(item.memberName)),
      DataCell(Text(item.kyLuatKhenThuongMember.toString())),
      DataCell(Text(item.chatLuongChuyenMonMember.toString())),
      DataCell(Text(item.bangChungHocTapPtMember.toString())),
      DataCell(Text(item.managerEvaluateCmt)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rsList.length;

  @override
  int get selectedRowCount => 0;
}
