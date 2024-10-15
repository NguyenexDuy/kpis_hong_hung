import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hong_hung_application/const.dart';

class DropdownButtonMonth extends StatefulWidget {
  DropdownButtonMonth(
      {super.key, this.onMonthSelected, required this.dropdownValue});
  final ValueChanged<int>? onMonthSelected;
  int dropdownValue;

  @override
  State<DropdownButtonMonth> createState() => _DropdownButtonMonthState();
}

class _DropdownButtonMonthState extends State<DropdownButtonMonth> {
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      leadingIcon: const Icon(Icons.calendar_today),
      dropdownMenuEntries: list
          .map((int value) => DropdownMenuEntry(
                value: value,
                label: value.toString(),
              ))
          .toList(),
      initialSelection: list.first,
      onSelected: (value) {
        setState(() {
          widget.dropdownValue = value!;
        });
        widget.onMonthSelected!(value!);
        log("gia tri dang chon: $value");
      },
    );
  }
}
