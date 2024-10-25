import 'package:flutter/material.dart';

class NhaplieuKpiKhoaPhongPage extends StatefulWidget {
  const NhaplieuKpiKhoaPhongPage({super.key});

  @override
  State<NhaplieuKpiKhoaPhongPage> createState() =>
      _NhaplieuKpiKhoaPhongPageState();
}

class _NhaplieuKpiKhoaPhongPageState extends State<NhaplieuKpiKhoaPhongPage> {
  TextEditingController phongBaocao = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phongBaocao.text = "Phòng báo cáo";
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
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: phongBaocao,
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
                        labelStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                Expanded(
                  child: TextFormField(
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
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
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
                ),
                Expanded(
                  child: TextFormField(
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
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
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
                ),
                Expanded(
                  child: TextFormField(
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
                ),
              ],
            ),
            TextFormField(
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
                ),
                Expanded(
                  child: TextFormField(
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
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
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
                ),
                Expanded(
                  child: TextFormField(
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
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
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
                ),
                Expanded(
                  child: TextFormField(
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
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
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
                ),
                Expanded(
                  child: TextFormField(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
