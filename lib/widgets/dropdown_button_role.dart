import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/models/role.dart';

class DropdownButtonRole extends StatefulWidget {
  DropdownButtonRole(
      {super.key,
      required this.myList,
      required this.dropdownValue,
      required this.title,
      required this.onChanged});
  final List<Role> myList;
  Role dropdownValue;
  String title;
  final Function(Role) onChanged;

  @override
  State<DropdownButtonRole> createState() => _DropdownButtonRoleState();
}

class _DropdownButtonRoleState extends State<DropdownButtonRole> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Role>(
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
      items: widget.myList.map<DropdownMenuItem<Role>>((Role value) {
        return DropdownMenuItem<Role>(
          value: value,
          child: Text(
            value.roleName,
          ),
        );
      }).toList(),
      value: widget.dropdownValue,
      onChanged: (Role? newValue) {
        setState(() {
          widget.dropdownValue = newValue!;
          widget.onChanged(newValue);
          log(newValue.roleName);
        });
      },
    );
  }
}
