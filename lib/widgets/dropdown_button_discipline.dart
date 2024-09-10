import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/const.dart';

class DropdownButtonDiscipline extends StatefulWidget {
  const DropdownButtonDiscipline({super.key});

  @override
  State<DropdownButtonDiscipline> createState() =>
      _DropdownButtonDisciplineState();
}

class _DropdownButtonDisciplineState extends State<DropdownButtonDiscipline> {
  String dropdownValue = myListt.first;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      initialSelection: myListt.first,
      onSelected: (value) {
        setState(() {
          dropdownValue = value!;
        });
        log("Kỷ luật lao động: $value");
      },
      dropdownMenuEntries: myListt
          .map((String value) => DropdownMenuEntry(value: value, label: value))
          .toList(),
    );
  }
}
