import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DyaryPage extends StatelessWidget {
  const DyaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Nhật ký KPIs cá nhân"),
      ),
      body: Center(
        child: Text("nhật ký cá nhân"),
      ),
    );
  }
}
