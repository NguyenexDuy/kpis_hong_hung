import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/models/models/room_type.dart';

class DropdownButtonRoomtype extends StatefulWidget {
  DropdownButtonRoomtype(
      {super.key,
      required this.myList,
      required this.dropdownValue,
      required this.title,
      required this.onChanged});
  final List<RoomType> myList;
  RoomType dropdownValue;
  String title;
  final Function(RoomType) onChanged;

  @override
  State<DropdownButtonRoomtype> createState() => _DropdownButtonRoomtypeState();
}

class _DropdownButtonRoomtypeState extends State<DropdownButtonRoomtype> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<RoomType>(
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
      items: widget.myList.map<DropdownMenuItem<RoomType>>((RoomType value) {
        return DropdownMenuItem<RoomType>(
          value: value,
          child: Text(
            value.room_name,
          ),
        );
      }).toList(),
      value: widget.dropdownValue,
      onChanged: (RoomType? newValue) {
        widget.dropdownValue = newValue!;
        widget.onChanged(newValue);
        log(newValue.room_symbol);
      },
    );
  }
}
