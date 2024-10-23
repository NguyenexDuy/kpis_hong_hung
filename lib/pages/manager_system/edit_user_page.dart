import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/admin_repo.dart';
import 'package:hong_hung_application/const.dart';
import 'package:hong_hung_application/models/models/rank_staff.dart';
import 'package:hong_hung_application/models/models/role.dart';
import 'package:hong_hung_application/models/models/room_type.dart';
import 'package:hong_hung_application/models/models/user.dart';
import 'package:hong_hung_application/widgets/dropdown_button_group.dart';
import 'package:hong_hung_application/widgets/dropdown_button_rankstaff.dart';
import 'package:hong_hung_application/widgets/dropdown_button_role.dart';
import 'package:hong_hung_application/widgets/dropdown_button_roomtype.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage(
      {super.key,
      required this.edit,
      this.user,
      this.rankStaff,
      this.role,
      this.roomType,
      this.group});
  final bool edit;
  final User? user;
  final RankStaff? rankStaff;
  final Role? role;
  final RoomType? roomType;
  final String? group;

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  String dropdownValue = myList.first;
  Future<List<RankStaff>>? rankStaffList;
  Future<List<Role>>? roleList;
  Future<List<RoomType>>? roomTypeList;
  RankStaff? selectionRankstaff;
  Role? selectionRole;
  RoomType? selectionRoomType;
  Map<String, dynamic>? selectedGroup = listGroup.first;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void addNewUser() async {
    String fullname = fullnameController.text;
    String password = passwordController.text;
    String username = usernameController.text;
    String email = emailController.text;
    String rank_code_ID = selectionRankstaff!.id.toString();
    String group_work = selectedGroup!['character'];
    String role_id = selectionRole!.id.toString();
    String room_type_ID = selectionRoomType!.room_id.toString();
    bool status = true;
    bool result = await AdminRepo().saveAccount(fullname, password, username,
        email, rank_code_ID, group_work, role_id, room_type_ID, status);
    if (result) {
      Navigator.pop(context, false);
      // Fluttertoast.showToast(
      //     msg: "Tạo User thành công",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
    }
  }

  void editCurrentUser() async {
    int idUser = widget.user!.id;
    String fullName = fullnameController.text;
    String email = emailController.text;
    int rank_code_ID = selectionRankstaff!.id;
    String group_work = selectedGroup!['character'];
    int role_id = selectionRole!.id;
    int room_type_ID = selectionRoomType!.room_id;
    bool status = true;
    String resultEdit = await AdminRepo().editUser(idUser, fullName, email,
        rank_code_ID, group_work, role_id, room_type_ID, status);
    log("ket qua edit user: $resultEdit");
  }

  @override
  void initState() {
    super.initState();
    rankStaffList = AdminRepo().getAllRankStaffForEditCreate();
    roleList = AdminRepo().getAllRoleUser();
    roomTypeList = AdminRepo().getAllRoom();
    selectedGroup = listGroup.first;
    if (widget.edit) {
      usernameController.text = widget.user!.username;
      fullnameController.text = widget.user!.fullname;
      emailController.text = widget.user!.email!;
      selectedGroup =
          listGroup.firstWhere((group) => group["character"] == widget.group);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.edit
            ? const Text("Chỉnh sửa user")
            : const Text("Thêm mới user"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                      enabled: widget.edit ? false : true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Colors.grey[400]!,
                          width: 2.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 2.0,
                        ),
                      ),
                      labelText: "USERNAME",
                      labelStyle: TextStyle(color: Colors.grey[400])),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: widget.edit
                    ? const SizedBox()
                    : TextFormField(
                        controller: passwordController,
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
                            labelText: "PASSWORD",
                            labelStyle: TextStyle(color: Colors.grey[400])),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                  controller: fullnameController,
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
                  controller: emailController,
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
                        //dropdownbutton rankstaff
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: FutureBuilder(
                              future: rankStaffList,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Text('Lỗi: ${snapshot.error}');
                                }
                                var listRank = snapshot.data!;
                                RankStaff initialRank = widget.edit
                                    ? listRank.firstWhere((rankstaff) =>
                                        rankstaff.id == widget.rankStaff!.id)
                                    : listRank.first;
                                selectionRankstaff = initialRank;

                                return DropdownButtonRankStaff(
                                    onChanged: (p0) {
                                      selectionRankstaff = p0;
                                    },
                                    myList: listRank,
                                    dropdownValue: selectionRankstaff!,
                                    title: "CẤP NHÂN SỰ");
                              }),
                        )),
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: DropdownButtonGroup(
                              onChanged: (p0) {
                                selectedGroup = p0;
                              },
                              myList: listGroup,
                              dropdownValue: selectedGroup!,
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
                        child: FutureBuilder(
                            future: roleList,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Lỗi: ${snapshot.error}');
                              }
                              List<Role> listRole = snapshot.data!;
                              Role initialRole = widget.edit
                                  ? listRole.firstWhere(
                                      (role) => role.id == widget.role!.id)
                                  : listRole.first;
                              selectionRole = initialRole;
                              return DropdownButtonRole(
                                  onChanged: (p0) {
                                    selectionRole = p0;
                                  },
                                  myList: listRole,
                                  dropdownValue: selectionRole!,
                                  title: "CẤP QUYỀN USER");
                            }),
                      )),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: FutureBuilder(
                            future: roomTypeList,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Lỗi: ${snapshot.error}');
                              }
                              List<RoomType> listRoomTyle = snapshot.data!;
                              RoomType initialRoomType = widget.edit
                                  ? listRoomTyle.firstWhere((roomType) =>
                                      roomType.room_id ==
                                      widget.roomType!.room_id)
                                  : listRoomTyle.first;
                              selectionRoomType ??= initialRoomType;
                              return DropdownButtonRoomtype(
                                  onChanged: (p0) {
                                    selectionRoomType = p0;
                                  },
                                  myList: listRoomTyle,
                                  dropdownValue: selectionRoomType!,
                                  title: "KHOA/PHÒNG");
                            }),
                      )),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  widget.edit ? editCurrentUser() : addNewUser();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 20)),
                child: Text(
                  widget.edit ? "Chỉnh sửa user" : "Tạo user mới",
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
