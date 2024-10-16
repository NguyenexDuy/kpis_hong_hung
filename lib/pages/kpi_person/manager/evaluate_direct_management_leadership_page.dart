import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/manager_repo.dart';

class EvaluateDirectManagementLeadershipPage extends StatefulWidget {
  const EvaluateDirectManagementLeadershipPage({super.key});

  @override
  State<EvaluateDirectManagementLeadershipPage> createState() =>
      _EvaluateDirectManagementLeadershipPageState();
}

class _EvaluateDirectManagementLeadershipPageState
    extends State<EvaluateDirectManagementLeadershipPage> {
  @override
  void initState() {
    super.initState();
    ManagerRepo().getResultmanagerLeaderAssessment(1, 2024);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đánh giá lãnh đạo quản lý trực tiếp"),
      ),
    );
  }
}
