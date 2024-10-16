import 'package:flutter/material.dart';

class ManagerAsBsNvvpPage extends StatefulWidget {
  const ManagerAsBsNvvpPage({super.key});

  @override
  State<ManagerAsBsNvvpPage> createState() => _ManagerAsBsNvvpPageState();
}

class _ManagerAsBsNvvpPageState extends State<ManagerAsBsNvvpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Trưởng/phòng khoa, Trưởng phòng đánh giá BS/NVVP"),
      ),
    );
  }
}
