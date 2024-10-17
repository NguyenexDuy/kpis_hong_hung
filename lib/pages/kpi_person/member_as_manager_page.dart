import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hong_hung_application/widgets/comming_soon_widget.dart';

class MemberAsManagerPage extends StatefulWidget {
  const MemberAsManagerPage({super.key});

  @override
  State<MemberAsManagerPage> createState() => _MemberAsManagerPageState();
}

class _MemberAsManagerPageState extends State<MemberAsManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đánh giá các cấp trên"),
      ),
      body: const CommingsoonWidget(),
    );
  }
}
