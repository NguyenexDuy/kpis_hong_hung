import 'package:flutter/material.dart';

class SelfAssessmentManager extends StatefulWidget {
  const SelfAssessmentManager({super.key});

  @override
  State<SelfAssessmentManager> createState() => _SelfAssessmentManagerState();
}

class _SelfAssessmentManagerState extends State<SelfAssessmentManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tự đánh giá bản thân"),
      ),
    );
  }
}
