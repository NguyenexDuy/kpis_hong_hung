import 'dart:developer';
import 'package:flutter/material.dart';

class DropdownButtonString extends StatefulWidget {
  DropdownButtonString(
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
  State<DropdownButtonString> createState() => _DropdownButtonStringState();
}

class _DropdownButtonStringState extends State<DropdownButtonString> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Map<String, dynamic>>(
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
      items: widget.myList.map<DropdownMenuItem<Map<String, dynamic>>>(
          (Map<String, dynamic> value) {
        return DropdownMenuItem<Map<String, dynamic>>(
          value: value,
          child: Text(
            value['result'],
          ),
        );
      }).toList(),
      value: widget.dropdownValue,
      onChanged: (Map<String, dynamic>? newValue) {
        setState(() {
          widget.dropdownValue = newValue!;
          widget.onChanged(newValue);
          log(newValue['id']);
        });
      },
    );
  }
}
