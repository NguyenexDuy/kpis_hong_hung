import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class KpisPersonPage extends StatelessWidget {
  const KpisPersonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("KPIs cá nhân"),
      ),
      body: Center(
        child: Text("kpis cá nhân"),
      ),
    );
  }
}
