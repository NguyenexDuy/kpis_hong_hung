import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Comming soon",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary),
            ),
            SvgPicture.asset(
              "assets/svg/undraw.svg",
              width: 300,
            )
          ],
        ),
      ),
    );
  }
}
