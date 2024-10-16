import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StaffEvaluateEachOther extends StatefulWidget {
  const StaffEvaluateEachOther({super.key});

  @override
  State<StaffEvaluateEachOther> createState() => _StaffEvaluateEachOtherState();
}

class _StaffEvaluateEachOtherState extends State<StaffEvaluateEachOther> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Các thành viên đánh giá lẫn nhau"),
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
