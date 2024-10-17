import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hong_hung_application/widgets/comming_soon_widget.dart';

class StaffEvaluateEachOther extends StatefulWidget {
  const StaffEvaluateEachOther({super.key});

  @override
  State<StaffEvaluateEachOther> createState() => _StaffEvaluateEachOtherState();
}

class _StaffEvaluateEachOtherState extends State<StaffEvaluateEachOther> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Các thành viên đánh giá lẫn nhau"),
        ),
        body: const CommingsoonWidget());
  }
}
