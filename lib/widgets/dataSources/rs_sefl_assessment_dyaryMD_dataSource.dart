import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/result/rs_selt_assessment_dyary.dart';

class ResultSeltAssessmentDyaryMDDataTableSource extends DataTableSource {
  ResultSeltAssessmentDyaryMDDataTableSource(this.rsList);
  final List<ResultSeltAssessmentDyary_MD> rsList;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= rsList.length) return null;
    final ResultSeltAssessmentDyary_MD item = rsList[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('${index + 1}')),
      DataCell(Text(item.staff_code)),
      DataCell(Text(item.name)),
      DataCell(Text(item.rank)),
      DataCell(Text(item.room_name)),
      DataCell(Text(item.created_at)),
      DataCell(Text(item.ky_luat_va_thuong.toString())),
      DataCell(Text(item.muc_do_phoi_hop.toString())),
      DataCell(Text(item.chat_luong_chuyen_mon.toString())),
      DataCell(Text(item.diem_muc_do_hoc_tap_pt.toString())),
      DataCell(Text(item.note.toString())),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => rsList.length;

  @override
  int get selectedRowCount => 0;
}
