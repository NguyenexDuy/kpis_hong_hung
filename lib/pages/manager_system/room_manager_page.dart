import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/admin_repo.dart';
import 'package:hong_hung_application/models/models/room_type.dart';

class RoomManagerPage extends StatefulWidget {
  const RoomManagerPage({super.key});

  @override
  State<RoomManagerPage> createState() => _RoomManagerPageState();
}

class _RoomManagerPageState extends State<RoomManagerPage> {
  Future<List<RoomType>>? futureMethod;
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
            ElevatedButton(
                onPressed: () {}, child: const Text("Xuất file Excel")),
            FutureBuilder(
              future: futureMethod,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Có lỗi xảy ra"));
                }
                List<RoomType> roomtypeList = snapshot.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
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
                    rows: roomtypeList.asMap().entries.map((enty) {
                      RoomType room = enty.value;
                      return DataRow(cells: <DataCell>[
                        DataCell(Text(room.room_id.toString())),
                        DataCell(Text(room.room_name)),
                        DataCell(Text(room.room_symbol)),
                        DataCell(Text(room.unique_username)),
                        DataCell(Text(room.created_by)),
                        DataCell(Text(room.created_at)),
                        DataCell(IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit_note_sharp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )),
                      ]);
                    }).toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
