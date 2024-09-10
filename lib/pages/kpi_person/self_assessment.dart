import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/const.dart';
import 'package:hong_hung_application/widgets/dropdown_button_discipline.dart';
import 'package:hong_hung_application/widgets/dropdown_button_month.dart';

class SelfAssessment extends StatelessWidget {
  const SelfAssessment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tự đánh giá"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Staff code"),
            TextFormField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'hh1008',
              ),
            ),
            const Text("Full Name"),
            TextFormField(
              enabled: false,
              decoration: InputDecoration(
                hintText: 'Nguyễn Sơn Ngọc',
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        children: [
                          Text("Tháng đánh giá"),
                          DropdownButtonMonth(),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [Text("Năm đánh giá"), Text("2024")],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Kỉ luật lao động và khen thưởng",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  DropdownButtonDiscipline()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chất lượng thực hiện chuyên môn",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  DropdownButtonDiscipline()
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mức độ học tập và phát triển bản thân",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  DropdownButtonDiscipline()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mức độ phối hợp trong hoạt động chuyên môn của khoa/phòng",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  DropdownButtonDiscipline()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
