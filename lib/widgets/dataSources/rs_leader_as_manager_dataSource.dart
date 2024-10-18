import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/result/rs_leader_as_manager.dart';

class RsLeaderAsManagerDataSource extends DataTableSource {
  final List<RsLeaderAsManager> listRs;

  RsLeaderAsManagerDataSource(this.listRs);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= listRs.length) return null;
    final RsLeaderAsManager item = listRs[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('${index + 1}')),
      DataCell(Text(item.assessedBy)),
      DataCell(Text(item.createdAt.toString())),
      DataCell(Text(item.managerName)),
      DataCell(Text(item.kyLuatKhenThuongManager.toString())),
      DataCell(Text(item.ktraGiamSatThucHienChuyenMonNv.toString())),
      DataCell(Text(item.bangChungHocTapPtManager.toString())),
      DataCell(Text(item.leaderCmt!)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => listRs.length;

  @override
  int get selectedRowCount => 0;
}
