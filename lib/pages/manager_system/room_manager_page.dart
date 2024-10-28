import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/admin_repo.dart';
import 'package:hong_hung_application/models/models/room_type.dart';
import 'package:hong_hung_application/pages/manager_system/eidt_room_page.dart';
import 'package:hong_hung_application/widgets/dataSources/roomtype_dataSource.dart';

class RoomManagerPage extends StatefulWidget {
  const RoomManagerPage({super.key});

  @override
  State<RoomManagerPage> createState() => _RoomManagerPageState();
}

class _RoomManagerPageState extends State<RoomManagerPage> {
  Future<List<RoomType>>? futureMethod;
  List<RoomType>? filteredRoomTypeList;
  bool edit = true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureMethod = AdminRepo().getAllRoom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quản lý Khoa/Phòng"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
              future: futureMethod,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Có lỗi xảy ra"));
                }

                List<RoomType> roomtypeList = snapshot.data!;
                filteredRoomTypeList = filteredRoomTypeList ?? roomtypeList;
                return SingleChildScrollView(
                  child: PaginatedDataTable(
                    header: TextField(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Colors.grey[
                                  400]!, // Màu viền khi ô không nhận focus
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
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Tìm kiếm",
                          hintStyle: const TextStyle(color: Colors.grey)),
                      controller: searchController,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            filteredRoomTypeList = roomtypeList
                                .where((room) => room.room_name
                                    .toLowerCase()
                                    .contains(value.toLowerCase()))
                                .toList();
                          } else {
                            filteredRoomTypeList = roomtypeList;
                          }
                        });
                      },
                    ),
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Id',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Khoa/Phòng',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Mã Khoa/Phòng',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Người phụ trách',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Created by',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Created at',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Action',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    source: RoomTypeDataTableSource(
                        filteredRoomTypeList!, context, edit),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          edit = false;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EidtRoomPage(
                  edit: edit,
                ),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
