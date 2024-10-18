import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/result/rs_personal_kpi.dart';

class ResultPersonalKpiDataTableSource extends DataTableSource {
  ResultPersonalKpiDataTableSource(this.rsList);
  final List<RsPersonalKpi> rsList;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= rsList.length) return null;
    final RsPersonalKpi item = rsList[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('${index + 1}')),
      DataCell(Text(item.staffCode.toString())),
      DataCell(Text(item.fullname!)),
      DataCell(Text(item.roomName)),
      DataCell(Text(item.teamMarkAssess.toString())),
      DataCell(Text(item.cs1.toString())),
      DataCell(Text(item.cs2.toString())),
      DataCell(Text(item.cs3.toString())),
      DataCell(Text(item.resultKPI.toString())),
      DataCell(Text(item.date!)),
      DataCell(Text(item.rankCode)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rsList.length;

  @override
  int get selectedRowCount => 0;
}
