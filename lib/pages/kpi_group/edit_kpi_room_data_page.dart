import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditKpiRoomDataPage extends StatefulWidget {
  const EditKpiRoomDataPage({super.key});

  @override
  State<EditKpiRoomDataPage> createState() => _EditKpiRoomDataPageState();
}

class _EditKpiRoomDataPageState extends State<EditKpiRoomDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chỉnh sửa KPI room data"),
      ),
    );
  }
}
