import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/models/member_assessment.dart';

class StaffEvaluateEachOtherDatasource extends DataTableSource {
  StaffEvaluateEachOtherDatasource(this.rsList);
  final List<MemberAssessment> rsList;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= rsList.length) return null;
    final MemberAssessment rsItem = rsList[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(rsItem.staffCode!)),
      DataCell(Text(rsItem.memberName!)),
      DataCell(Text(rsItem.username!.rankCode.rank_name)),
      DataCell(IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {},
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rsList.length;

  @override
  int get selectedRowCount => 0;
}
