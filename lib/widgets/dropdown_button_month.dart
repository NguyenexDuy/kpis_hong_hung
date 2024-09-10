import 'package:flutter/material.dart';
import 'package:hong_hung_application/const.dart';

class DropdownButtonMonth extends StatefulWidget {
  const DropdownButtonMonth({super.key});

  @override
  State<DropdownButtonMonth> createState() => _DropdownButtonMonthState();
}

class _DropdownButtonMonthState extends State<DropdownButtonMonth> {
  int dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      dropdownMenuEntries: list
          .map((int value) => DropdownMenuEntry(
                value: value,
                label: value.toString(),
              ))
          .toList(),
      initialSelection: list.first,
      onSelected: (value) {
        setState(() {
          dropdownValue = value!;
        });
      },
    );
  }
}
