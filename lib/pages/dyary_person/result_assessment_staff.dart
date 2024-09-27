import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/staff_repo.dart';
import 'package:hong_hung_application/models/result/rs_member_assess.dart';
import 'package:hong_hung_application/widgets/dropdown_button_month.dart';

class ResultAssessmentStaff extends StatefulWidget {
  const ResultAssessmentStaff({super.key});

  @override
  State<ResultAssessmentStaff> createState() => _ResultAssessmentStaffState();
}

class _ResultAssessmentStaffState extends State<ResultAssessmentStaff> {
  late Future<List<RsMemberAssess>> mlist;
  int selectedMonth = 1;
  int selectedYear = DateTime.now().year;
  TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mlist = GetSelfAsStaffRepo().getMemberAssess(3, 2024);
  }

  void _incrementYear() {
    setState(() {
      selectedYear++;
    });
  }

  void _decrementYear() {
    if (selectedYear != DateTime.now().year) {
      setState(() {
        selectedYear--;
      });
    }
  }

  void _onMonthChanged(int newMonth) {
    setState(() {
      selectedMonth = newMonth;
      // Cập nhật lại Future mỗi khi tháng thay đổi
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kết quả đánh giá cấp nhân viên"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  const Text(
                    "Chọn tháng",
                    style: TextStyle(fontSize: 18),
                  ),
                  DropdownButtonMonth(
                    onMonthSelected: _onMonthChanged,
                  ),
                ],
              ),
              Column(
                children: [
                  const Text(
                    "Chọn năm",
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.black)),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: _decrementYear,
                        ),
                        Text(
                          "$selectedYear",
                          style: const TextStyle(fontSize: 24),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: _incrementYear,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          FutureBuilder(
            future: mlist,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text("Có lỗi xảy ra"));
              }
              List<RsMemberAssess> mList = snapshot.data!;
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const <DataColumn>[
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
                          'Nhân viên được đánh giá',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Mức độ phối hợp hoạt động chuyên môn',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Người đánh giá',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Tháng/Năm',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          'Ý kiến đánh giá',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                  rows: mList.asMap().entries.map((entry) {
                    RsMemberAssess item = entry.value;
                    return DataRow(cells: <DataCell>[
                      DataCell(Text(item.staffCode.toString())),
                      DataCell(Text(item.memberName)),
                      DataCell(Text(item.markMemberAssess.toString())),
                      DataCell(Text(item.assessedBy)),
                      DataCell(Text("${item.month}/${item.year}")),
                      DataCell(Text(item.noteDesc)),
                    ]);
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
