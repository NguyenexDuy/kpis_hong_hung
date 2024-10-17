import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CommingsoonWidget extends StatelessWidget {
  const CommingsoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
