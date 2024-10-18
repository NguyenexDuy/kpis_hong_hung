import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/result/rs_member_assess.dart';

class RsAssessmentStaffDataTableSource extends DataTableSource {
  RsAssessmentStaffDataTableSource(this.rsList);
  final List<RsMemberAssess> rsList;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= rsList.length) return null;
    final RsMemberAssess rsItem = rsList[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(rsItem.staffCode)),
      DataCell(Text(rsItem.memberName)),
      DataCell(Text(rsItem.markMemberAssess.toString())),
      DataCell(Text(rsItem.assessedBy)),
      DataCell(Text("${rsItem.month}/${rsItem.year}")),
      DataCell(Text(rsItem.noteDesc)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rsList.length;

  @override
  int get selectedRowCount => 0;
}
