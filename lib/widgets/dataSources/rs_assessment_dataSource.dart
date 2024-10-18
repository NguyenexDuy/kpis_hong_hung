import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/result/rs_selt_assessment_dyary.dart';

class ResultAssessmentDataSource extends DataTableSource {
  final List<ResultSeltAssessmentDyary_MD> listRs;

  ResultAssessmentDataSource(this.listRs);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= listRs.length) return null;
    final ResultSeltAssessmentDyary_MD rs = listRs[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text((index + 1).toString())),
      DataCell(Text(rs.staff_code)),
      DataCell(Text(rs.name)),
      DataCell(Text(rs.rank)),
      DataCell(Text(rs.room_name)),
      DataCell(Text(rs.created_at)),
      DataCell(Text(rs.ky_luat_va_thuong.toString())),
      DataCell(Text(rs.muc_do_phoi_hop.toString())),
      DataCell(Text(rs.chat_luong_chuyen_mon.toString())),
      DataCell(Text(rs.diem_muc_do_hoc_tap_pt.toString())),
      DataCell(Text(rs.note)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => listRs.length;

  @override
  int get selectedRowCount => 0;
}
