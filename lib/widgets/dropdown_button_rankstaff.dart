import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/models/rank_staff.dart';

class DropdownButtonRankStaff extends StatefulWidget {
  DropdownButtonRankStaff(
      {super.key,
      required this.myList,
      required this.dropdownValue,
      required this.title,
      required this.onChanged});
  final List<RankStaff> myList;
  RankStaff dropdownValue;
  String title;
  final Function(RankStaff) onChanged;

  @override
  State<DropdownButtonRankStaff> createState() =>
      _DropdownButtonRankStaffState();
}

class _DropdownButtonRankStaffState extends State<DropdownButtonRankStaff> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<RankStaff>(
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
      items: widget.myList.map<DropdownMenuItem<RankStaff>>((RankStaff value) {
        return DropdownMenuItem<RankStaff>(
          value: value,
          child: Text(
            value.rank_name,
          ),
        );
      }).toList(),
      value: widget.dropdownValue,
      onChanged: (RankStaff? newValue) {
        widget.dropdownValue = newValue!;
        widget.onChanged(newValue);
        log(newValue.rank_name);
      },
    );
  }
}
