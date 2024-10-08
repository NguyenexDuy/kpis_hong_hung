import 'package:flutter/material.dart';
import 'package:hong_hung_application/const.dart';
import 'package:hong_hung_application/widgets/dropdown_level.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({super.key});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  String dropdownValue = myList.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thêm mới user"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors
                            .grey[400]!, // Màu viền khi ô không nhận focus
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Màu viền khi ô nhận focus
                        width: 2.0,
                      ),
                    ),
                    labelText: "USERNAME",
                    labelStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors
                            .grey[400]!, // Màu viền khi ô không nhận focus
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Màu viền khi ô nhận focus
                        width: 2.0,
                      ),
                    ),
                    labelText: "PASSWORD",
                    labelStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors
                            .grey[400]!, // Màu viền khi ô không nhận focus
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Màu viền khi ô nhận focus
                        width: 2.0,
                      ),
                    ),
                    labelText: "FULLNAME",
                    labelStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors
                            .grey[400]!, // Màu viền khi ô không nhận focus
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .primary, // Màu viền khi ô nhận focus
                        width: 2.0,
                      ),
                    ),
                    labelText: "EMAIL",
                    labelStyle: TextStyle(color: Colors.grey[400])),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: DropdownLevel(
                            myList: myList,
                            dropdownValue: dropdownValue,
                            title: "CẤP NHÂN SỰ"),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: DropdownLevel(
                            myList: myList,
                            dropdownValue: dropdownValue,
                            title: "NHÓM TRỰC THUỘC"),
                      )),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: DropdownLevel(
                          myList: myList,
                          dropdownValue: dropdownValue,
                          title: "CẤP QUYỀN USER"),
                    )),
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: DropdownLevel(
                          myList: myList,
                          dropdownValue: dropdownValue,
                          title: "KHOA/PHÒNG"),
                    )),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Tạo user mới",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
            )
          ],
        ),
      ),
    );
  }
}
