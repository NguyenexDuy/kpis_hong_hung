import 'package:flutter/material.dart';
import 'package:hong_hung_application/widgets/comming_soon_widget.dart';

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
        title: const Text("Trưởng/phòng khoa, Trưởng phòng đánh giá BS/NVVP"),
      ),
      body: const CommingsoonWidget(),
    );
  }
}
