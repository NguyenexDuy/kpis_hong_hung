import 'package:flutter/material.dart';

class ResultselfassessmentDyary extends StatefulWidget {
  const ResultselfassessmentDyary({super.key});

  @override
  State<ResultselfassessmentDyary> createState() =>
      _ResultselfassessmentDyaryState();
}

class _ResultselfassessmentDyaryState extends State<ResultselfassessmentDyary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kết quả tự đánh giá"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: <DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text(
                  'STT',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Mã nhân viên',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Họ tên',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Cấp nhân sự',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Center(
                  child: Text(
                    'Đơn vị',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Tháng đánh giá',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: SizedBox(
                width: 100,
                child: Text(
                  'Kỷ luật lđ và khen thưởng',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Container(
                width: 250,
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  'Mức độ phối hợp trong hoạt động chuyên môn của khoa phòng',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Chất lượng thực hiện chuyên môn',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Mức độ học tập và phát triển bản thân',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'Ghi chú',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(Text('1')),
                DataCell(Center(child: Text('hh1008'))),
                DataCell(Text('Nguyễn Sơn Ngọc')),
                DataCell(Text('Nhân viên nghiệp vụ')),
                DataCell(Text('Phòng Công Nghệ Thông Tin')),
                DataCell(Text('1/2024	')),
                DataCell(Text('19')),
                DataCell(Text('19')),
                DataCell(Text('19')),
                DataCell(Text('19')),
                DataCell(Text('19')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('1')),
                DataCell(Center(child: Text('hh1008'))),
                DataCell(Text('Nguyễn Sơn Ngọc')),
                DataCell(Text('Nhân viên nghiệp vụ')),
                DataCell(Text('Phòng Công Nghệ Thông Tin')),
                DataCell(Text('1/2024	')),
                DataCell(Text('19')),
                DataCell(Text('19')),
                DataCell(Text('19')),
                DataCell(Text('19')),
                DataCell(Text('19')),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(Text('1')),
                DataCell(Center(child: Text('hh1008'))),
                DataCell(Text('Nguyễn Sơn Ngọc')),
                DataCell(Text('Nhân viên nghiệp vụ')),
                DataCell(Text('Phòng Công Nghệ Thông Tin')),
                DataCell(Text('1/2024	')),
                DataCell(Text('19')),
                DataCell(Text('19')),
                DataCell(Text('19')),
                DataCell(Text('19')),
                DataCell(Text('19')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
