import 'package:flutter/material.dart';

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
    );
  }
}
