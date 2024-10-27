import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/room_repo.dart';
import 'package:hong_hung_application/const.dart';
import 'package:hong_hung_application/models/models/kpi_room_data.dart';
import 'package:hong_hung_application/widgets/dropdown_button_style_string.dart';

class NhaplieuKpiKhoaPhongPage extends StatefulWidget {
  const NhaplieuKpiKhoaPhongPage({super.key, required this.kpiRoomData});
  final KpiRoomData kpiRoomData;

  @override
  State<NhaplieuKpiKhoaPhongPage> createState() =>
      _NhaplieuKpiKhoaPhongPageState();
}

class _NhaplieuKpiKhoaPhongPageState extends State<NhaplieuKpiKhoaPhongPage> {
  TextEditingController maPhongBaocaoController = TextEditingController();
  TextEditingController phongBaocaoController = TextEditingController();
  TextEditingController maPhongChiuTrachNhiemController =
      TextEditingController();
  TextEditingController phongChiuTrachNhiemController = TextEditingController();
  TextEditingController monthControlle = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController chiSoKPIBaoCaoController = TextEditingController();
  TextEditingController typeChiTieuController = TextEditingController();
  TextEditingController typeSoSanhController = TextEditingController();
  TextEditingController motaChiTieuController = TextEditingController();
  TextEditingController diemHieuChinhController = TextEditingController();
  TextEditingController nhapChiTieuController = TextEditingController();
  TextEditingController dinhDangController = TextEditingController();
  TextEditingController tsThucHienController = TextEditingController();
  TextEditingController mschungController = TextEditingController();
  String? dropDownValue;
  @override
  void initState() {
    super.initState();
    maPhongBaocaoController.text = widget.kpiRoomData.roomReportSymbol;
    maPhongChiuTrachNhiemController.text =
        widget.kpiRoomData.roomResponsibleSymbol;
    phongBaocaoController.text = widget.kpiRoomData.roomReport!;
    phongChiuTrachNhiemController.text = widget.kpiRoomData.roomResponsible!;
    monthControlle.text = widget.kpiRoomData.month.toString();
    yearController.text = widget.kpiRoomData.year.toString();
    chiSoKPIBaoCaoController.text = widget.kpiRoomData.kpiName;
    motaChiTieuController.text = widget.kpiRoomData.goal.toString();
    typeSoSanhController.text = widget.kpiRoomData.compareType;
    diemHieuChinhController.text = widget.kpiRoomData.diemHieuChinh.toString();
    nhapChiTieuController.text = widget.kpiRoomData.chiTieu.toString();
    tsThucHienController.text = widget.kpiRoomData.tsThucHien.toString();
    mschungController.text = widget.kpiRoomData.msChung.toString();
    log("currency: ${widget.kpiRoomData.currency}");
    dropDownValue = dinhDang.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nhập liệu KPI cho khoa/phòng"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextFormField(
                controller: maPhongBaocaoController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                        width: 2.0,
                      ),
                    ),
                    enabled: false,
                    labelText: "Mã khoa/phòng",
                    labelStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            TextFormField(
              controller: phongBaocaoController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                      width: 2.0,
                    ),
                  ),
                  enabled: false,
                  labelText: "Phòng báo cáo",
                  labelStyle: TextStyle(color: Colors.grey[400])),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextFormField(
                controller: maPhongChiuTrachNhiemController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.grey[400]!,
                        width: 2.0,
                      ),
                    ),
                    enabled: false,
                    labelText: "Mã khoa/phòng",
                    labelStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            TextFormField(
              controller: phongChiuTrachNhiemController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                      width: 2.0,
                    ),
                  ),
                  enabled: false,
                  labelText: "Phòng chịu trách nhiệm",
                  labelStyle: TextStyle(color: Colors.grey[400])),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: monthControlle,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                            width: 2.0,
                          ),
                        ),
                        enabled: false,
                        labelText: "Tháng",
                        labelStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: yearController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                            width: 2.0,
                          ),
                        ),
                        enabled: false,
                        labelText: "Năm",
                        labelStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: chiSoKPIBaoCaoController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey[400]!,
                      width: 2.0,
                    ),
                  ),
                  enabled: false,
                  labelText: "Chỉ số KPI báo cáo",
                  labelStyle: TextStyle(color: Colors.grey[400])),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: typeChiTieuController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                            width: 2.0,
                          ),
                        ),
                        enabled: false,
                        labelText: "Loại chỉ tiêu",
                        labelStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: typeSoSanhController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                            width: 2.0,
                          ),
                        ),
                        enabled: false,
                        labelText: "Kiểu so sánh",
                        labelStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: motaChiTieuController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                            width: 2.0,
                          ),
                        ),
                        enabled: false,
                        labelText: "Mô tả chỉ tiêu",
                        labelStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: diemHieuChinhController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                            width: 2.0,
                          ),
                        ),
                        labelText: "Điểm hiệu chỉnh",
                        labelStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: nhapChiTieuController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                            width: 2.0,
                          ),
                        ),
                        labelText: "Nhập chỉ tiêu",
                        labelStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
                Expanded(
                    child: DropdownButtonStyleString(
                  mlist: dinhDang,
                  title: "Định dạng",
                  dropDownValue: dropDownValue!,
                  onChanged: (p0) {
                    dropDownValue = p0;
                  },
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: tsThucHienController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                            width: 2.0,
                          ),
                        ),
                        labelText: "TS thực hiện",
                        labelStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: mschungController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.grey[400]!,
                            width: 2.0,
                          ),
                        ),
                        labelText: "MS chung",
                        labelStyle: TextStyle(color: Colors.grey[400])),
                  ),
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  int idRoomData = widget.kpiRoomData.id!;
                  double msChung = double.parse(mschungController.text);
                  double chiTieu = double.parse(nhapChiTieuController.text);
                  double diemHieuChinh =
                      double.parse(diemHieuChinhController.text);
                  double tsThucHien = double.parse(tsThucHienController.text);
                  String currency = dropDownValue!;
                  bool result = await RoomRepo().saveUpdateKpiRoomData(
                      idRoomData,
                      msChung,
                      chiTieu,
                      diemHieuChinh,
                      tsThucHien,
                      currency);
                  log("ket qua nhap lieu: $result");
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40)),
                child: const Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
