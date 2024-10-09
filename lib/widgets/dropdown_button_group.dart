import 'dart:developer';
import 'package:flutter/material.dart';

class DropdownButtonGroup extends StatefulWidget {
  DropdownButtonGroup(
      {super.key,
      required this.myList,
      required this.dropdownValue,
      required this.title,
      required this.onChanged});
  final List<Map<String, dynamic>> myList;
  Map<String, dynamic> dropdownValue;
  String title;
  final Function(Map<String, dynamic>) onChanged;

  @override
  State<DropdownButtonGroup> createState() => _DropdownButtonGroupState();
}

class _DropdownButtonGroupState extends State<DropdownButtonGroup> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Map<String, dynamic>>(
      isExpanded: true,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Colors.grey[400]!,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2.0,
            ),
          ),
          labelText: widget.title,
          labelStyle: TextStyle(color: Colors.grey[400])),
      items: widget.myList.map<DropdownMenuItem<Map<String, dynamic>>>(
        (Map<String, dynamic> value) {
          return DropdownMenuItem<Map<String, dynamic>>(
            value: value,
            child: Text(value["name"]),
          );
        },
      ).toList(),
      onChanged: (Map<String, dynamic>? newValue) {
        setState(() {
          widget.dropdownValue = newValue!;
          widget.onChanged(newValue);
          log(newValue["name"]);
        });
      },
    );
  }
}
