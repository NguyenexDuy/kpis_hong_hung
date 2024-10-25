import 'dart:developer';

import 'package:flutter/material.dart';

class DropdownButtonStyleString extends StatefulWidget {
  DropdownButtonStyleString(
      {super.key,
      required this.mlist,
      required this.title,
      required this.dropDownValue,
      required this.onChanged});
  final List<String> mlist;
  String dropDownValue;
  final String title;
  final Function(String) onChanged;

  @override
  State<DropdownButtonStyleString> createState() =>
      _DropdownButtonStyleStringState();
}

class _DropdownButtonStyleStringState extends State<DropdownButtonStyleString> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Colors.grey[400]!, // Màu viền khi không được focus
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context)
                  .colorScheme
                  .primary, // Màu viền khi nhận focus
              width: 2.0,
            ),
          ),
          labelText: widget.title,
          labelStyle: TextStyle(color: Colors.grey[400])),
      items: widget.mlist.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
          ),
        );
      }).toList(),
      value: widget.dropDownValue,
      onChanged: (String? newValue) {
        widget.onChanged(newValue!);
        widget.dropDownValue = newValue;
        log("value: $newValue");
      },
    );
  }
}
