import 'package:flutter/material.dart';
import 'package:hong_hung_application/widgets/comming_soon_widget.dart';

class CommingSoonPage extends StatelessWidget {
  const CommingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comming soon"),
      ),
      body: const CommingsoonWidget(),
    );
  }
}
