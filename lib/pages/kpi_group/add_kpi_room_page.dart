import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/room_repo.dart';
import 'package:hong_hung_application/models/models/room_type.dart';
import 'package:hong_hung_application/widgets/dropdown_button_roomtype.dart';
import 'package:hong_hung_application/widgets/dropdown_level.dart';

class AddKpiRoomPage extends StatefulWidget {
  const AddKpiRoomPage({super.key});

  @override
  State<AddKpiRoomPage> createState() => _AddKpiRoomPageState();
}

class _AddKpiRoomPageState extends State<AddKpiRoomPage> {
  Future<List<RoomType>>? listRoom;
  @override
  void initState() {
    super.initState();
    listRoom = RoomRepo().getAllRoomForAddKPI();
  }

  TextEditingController chiSoBaoCao = TextEditingController();
  TextEditingController chiTieu = TextEditingController();
  RoomType? selectedRoomReport;
  RoomType? selectedRoomResponsible;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thêm mới chỉ số KPI các Khoa/Phòng"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: SingleChildScrollView(
          child: FutureBuilder(
              future: listRoom,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Hiển thị loading
                } else if (snapshot.hasError) {
                  return Text('Lỗi: ${snapshot.error}');
                }
                List<RoomType> listRoomType = snapshot.data!;
                List<String> listString =
                    listRoomType.map((e) => e.room_name).toList();
                RoomType initialRoom = listRoomType.first;
                List<String> listKpi = ["Tháng", "Quý", "Năm"];
                List<String> listCompare = ["Less", "More"];
                String dropdownValueReport = listRoomType.first.room_name;
                String dropdownValueResponsive = listRoomType.first.room_name;
                String dropdownKPI = listKpi.first;
                String compare = listCompare.first;
                selectedRoomReport ??= initialRoom;
                selectedRoomResponsible ??= initialRoom;

                return Column(
                  children: [
                    DropdownButtonRoomtype(
                      dropdownValue: selectedRoomReport!,
                      title: "Phòng báo cáo",
                      myList: listRoomType,
                      onChanged: (p0) {
                        setState(() {
                          selectedRoomReport = p0;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonRoomtype(
                      dropdownValue: selectedRoomResponsible!,
                      title: "Phòng chịu trách nhiệm",
                      myList: listRoomType,
                      onChanged: (p0) {
                        selectedRoomResponsible = p0;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: chiSoBaoCao,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Colors.grey[400]!,
                            ),
                          ),
                          labelText: "Nhập tên chỉ số báo cáo"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: DropdownLevel(
                            dropdownValue: dropdownKPI,
                            title: "Loại KPI",
                            myList: listKpi,
                          ),
                        ),
                        Expanded(
                          child: DropdownLevel(
                            dropdownValue: compare,
                            title: "Kiểu so sánh",
                            myList: listCompare,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: chiTieu,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(
                              color: Colors.grey[400]!,
                            ),
                          ),
                          labelText: "Chỉ tiêu"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20)),
                          onPressed: () async {
                            if (selectedRoomReport != null &&
                                selectedRoomResponsible != null) {
                              log("report room: ${selectedRoomReport!.room_symbol}");
                              bool result = await RoomRepo().addKpiForRoom(
                                  chiSoBaoCao.text,
                                  dropdownKPI,
                                  compare,
                                  selectedRoomResponsible!.room_symbol,
                                  selectedRoomReport!.room_symbol,
                                  chiTieu.text);
                              if (result) {
                                log("Success");
                              } else
                                log("FAILED");
                            }
                          },
                          child: const Text(
                            "Tạo",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}
