import 'dart:developer';

import 'package:flutter/material.dart';

class DropdownLevel extends StatefulWidget {
  DropdownLevel(
      {super.key,
      required this.myList,
      required this.dropdownValue,
      required this.title});
  final List<String> myList;
  String dropdownValue;
  String title;

  @override
  State<DropdownLevel> createState() => _DropdownLevelState();
}

class _DropdownLevelState extends State<DropdownLevel> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      isExpanded: true,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.grey[400]!, // Màu viền khi không được focus
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Màu viền khi nhận focus
              width: 2.0,
            ),
          ),
          labelText: widget.title,
          labelStyle: TextStyle(color: Colors.grey[400])),
      items: widget.myList.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
      value: widget.dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          widget.dropdownValue = newValue!;
          log(newValue);
        });
      },
    );
  }
}
