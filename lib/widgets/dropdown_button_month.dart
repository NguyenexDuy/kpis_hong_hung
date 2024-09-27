import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/const.dart';

class DropdownButtonMonth extends StatefulWidget {
  const DropdownButtonMonth({super.key, this.onMonthSelected});
  final ValueChanged<int>? onMonthSelected;

  @override
  State<DropdownButtonMonth> createState() => _DropdownButtonMonthState();
}

class _DropdownButtonMonthState extends State<DropdownButtonMonth> {
  int dropdownValue = list.first;
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
          dropdownValue = value!;
        });
        widget.onMonthSelected!(value!);
        log("gia tri dang chon: $value");
      },
    );
  }
}
