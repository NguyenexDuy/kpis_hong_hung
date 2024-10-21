import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/admin_repo.dart';
import 'package:hong_hung_application/models/models/room_type.dart';
import 'package:hong_hung_application/models/models/user.dart';
import 'package:hong_hung_application/storage/security_storage.dart';
import 'package:hong_hung_application/widgets/dropdown_button_userForEditRoom.dart';

class EidtRoomPage extends StatefulWidget {
  const EidtRoomPage({super.key, required this.edit, this.roomType});
  final bool edit;
  final RoomType? roomType;

  @override
  State<EidtRoomPage> createState() => _EidtRoomPageState();
}

class _EidtRoomPageState extends State<EidtRoomPage> {
  Future<List<User>>? futureMethod;

  User? selectionUser;

  TextEditingController roomNameController = TextEditingController();
  TextEditingController roomSymbolController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // futureMethod = widget.edit
    //     ? AdminRepo().getAllUserForEditRoom()
    //     : AdminRepo().getAllUserForCreateRoom();

    widget.edit
        ? futureMethod = AdminRepo().getAllUserForEditRoom()
        : futureMethod = AdminRepo().getAllUserForCreateRoom();

    if (widget.edit && widget.roomType != null) {
      roomNameController.text = widget.roomType!.room_name;
      roomSymbolController.text = widget.roomType!.room_symbol;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.edit
            ? const Text("Chỉnh sửa phòng ")
            : const Text("Thêm phòng mới"),
      ),
      body: FutureBuilder(
          future: futureMethod,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Có lỗi xảy ra"));
            }
            var mylist = snapshot.data;
            // User userInitial = mylist!.first;
            User userSelected = widget.edit
                ? mylist!.firstWhere(
                    (user) => user.fullname == widget.roomType!.unique_username)
                : mylist!.first;
            selectionUser = userSelected;
            return Column(
              children: [
                TextFormField(
                  controller: roomNameController,
                  decoration: const InputDecoration(hintText: "Room name"),
                ),
                TextFormField(
                  controller: roomSymbolController,
                  decoration: const InputDecoration(hintText: "Room symbol"),
                ),
                DropdownButtonUserforeditroom(
                  myList: mylist,
                  dropdownValue: selectionUser!,
                  title: "Cấp nhân sự",
                  onChanged: (p0) {
                    selectionUser = p0;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      widget.edit ? editCurrentRoom() : addNewRoom();
                    },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        backgroundColor: Theme.of(context).colorScheme.primary),
                    child: Text(
                      widget.edit ? "Chỉnh sửa" : "Tạo",
                      style: const TextStyle(color: Colors.white),
                    ))
              ],
            );
          }),
    );
  }

  void editCurrentRoom() async {
    String roomID = widget.roomType!.room_id.toString();
    String roomName = roomNameController.text;
    String roomSymbol = roomSymbolController.text;
    String uniqueUsername = selectionUser!.username;
    log(uniqueUsername);
    bool result = await AdminRepo()
        .editCurrentRoom(roomID, roomName, roomSymbol, uniqueUsername);
    Navigator.pop(context);
  }

  void addNewRoom() async {
    String roomName = roomNameController.text;
    String roomSymbol = roomSymbolController.text;
    String uniqueUsername = selectionUser!.username;
    User? user = await SecurityStorage.getUser();
    String createdBy = user.fullname;
    bool result = await AdminRepo()
        .addNewRoom(roomName, roomSymbol, uniqueUsername, createdBy);
  }
}
