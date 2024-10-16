import 'package:flutter/material.dart';

class ManagerAsOtherManagerPage extends StatefulWidget {
  const ManagerAsOtherManagerPage({super.key});

  @override
  State<ManagerAsOtherManagerPage> createState() =>
      _ManagerAsOtherManagerPageState();
}

class _ManagerAsOtherManagerPageState extends State<ManagerAsOtherManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trưởng nhóm đánh giá các trưởng nhóm khác"),
      ),
    );
  }
}
