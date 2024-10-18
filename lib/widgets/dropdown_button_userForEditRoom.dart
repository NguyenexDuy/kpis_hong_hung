import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/models/user.dart';

class DropdownButtonUserforeditroom extends StatefulWidget {
  DropdownButtonUserforeditroom(
      {super.key,
      required this.myList,
      required this.dropdownValue,
      required this.title,
      required this.onChanged});
  final List<User> myList;
  User dropdownValue;
  String title;
  final Function(User) onChanged;
  @override
  State<DropdownButtonUserforeditroom> createState() =>
      _DropdownButtonUserforeditroomState();
}

class _DropdownButtonUserforeditroomState
    extends State<DropdownButtonUserforeditroom> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<User>(
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
      items: widget.myList.map<DropdownMenuItem<User>>((User value) {
        return DropdownMenuItem<User>(
          value: value,
          child: Text(
            value.fullname,
          ),
        );
      }).toList(),
      value: widget.dropdownValue,
      onChanged: (User? newValue) {
        setState(() {
          widget.dropdownValue = newValue!;
          widget.onChanged(newValue);
          log(newValue.username);
        });
      },
    );
  }
}
