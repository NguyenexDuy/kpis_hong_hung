import 'package:flutter/material.dart';

class EvaluateDdtKtytHstPage extends StatefulWidget {
  const EvaluateDdtKtytHstPage({super.key});

  @override
  State<EvaluateDdtKtytHstPage> createState() => _EvaluateDdtKtytHstPageState();
}

class _EvaluateDdtKtytHstPageState extends State<EvaluateDdtKtytHstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đánh giá phó khoa/phfong hoặc ĐDT/KTYT/HST"),
      ),
    );
  }
}
