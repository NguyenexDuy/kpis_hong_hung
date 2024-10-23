import 'package:flutter/material.dart';
import 'package:hong_hung_application/widgets/comming_soon_widget.dart';

class TheheadnurseMedicalstaffMidwifeEvaluateGroupLeadersPage
    extends StatelessWidget {
  const TheheadnurseMedicalstaffMidwifeEvaluateGroupLeadersPage({super.key});

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
              "Điều dưỡng/KTY/Hộ sinh trưởng khoa đánh giá các nhóm trưởng(nếu có)"),
        ),
        body: const CommingsoonWidget(),
      );
  }
}
