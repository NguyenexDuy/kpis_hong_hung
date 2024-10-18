import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/result/rs_manager_as_member.dart';

class ResultManagerAsMemberDataSource extends DataTableSource {
  final List<RsManagerAsMember> listRs;

  ResultManagerAsMemberDataSource(this.listRs);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= listRs.length) return null;
    final RsManagerAsMember item = listRs[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('${index + 1}')),
      DataCell(Text(item.createdAt.toString())),
      DataCell(Text(item.assessedBy)),
      DataCell(Text(item.roomName)),
      DataCell(Text(item.markMemberAssessedAverage.toString())),
      DataCell(Text(item.memberName)),
      DataCell(Text(item.kyLuatKhenThuongMember.toString())),
      DataCell(Text(item.chatLuongChuyenMonMember.toString())),
      DataCell(Text(item.bangChungHocTapPtMember.toString())),
      DataCell(Text(item.managerEvaluateCmt!)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => listRs.length;

  @override
  int get selectedRowCount => 0;
}
