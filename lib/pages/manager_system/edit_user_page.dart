import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/repository/admin_repo.dart';
import 'package:hong_hung_application/const.dart';
import 'package:hong_hung_application/models/models/rank_staff.dart';
import 'package:hong_hung_application/models/models/role.dart';
import 'package:hong_hung_application/models/models/room_type.dart';
import 'package:hong_hung_application/widgets/dropdown_button_group.dart';
import 'package:hong_hung_application/widgets/dropdown_button_rankstaff.dart';
import 'package:hong_hung_application/widgets/dropdown_button_role.dart';
import 'package:hong_hung_application/widgets/dropdown_button_roomtype.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({super.key});

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
  Map<String, dynamic> selectedGroup = listGroup.first;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    rankStaffList = AdminRepo().getAllRankStaffForEditCreate();
    roleList = AdminRepo().getAllRoleUser();
    roomTypeList = AdminRepo().getAllRoom();
    selectedGroup = listGroup.first;
  }

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
                controller: usernameController,
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
                controller: passwordController,
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
                              List<RankStaff> listRank = snapshot.data!;
                              RankStaff initialRank = listRank.first;
                              selectionRankstaff ??= initialRank;

                              return DropdownButtonRankStaff(
                                  onChanged: (p0) {
                                    setState(() {
                                      selectionRankstaff = p0;
                                    });
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
                            dropdownValue: selectedGroup,
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
                            Role initialRole = listRole.first;
                            selectionRole ??= initialRole;
                            return DropdownButtonRole(
                                onChanged: (p0) {
                                  setState(() {
                                    selectionRole = p0;
                                  });
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
                            RoomType initialRoomType = listRoomTyle.first;
                            selectionRoomType ??= initialRoomType;
                            return DropdownButtonRoomtype(
                                onChanged: (p0) {
                                  setState(() {
                                    selectionRoomType = p0;
                                  });
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
              onPressed: () async {
                String fullname = fullnameController.text;
                String password = passwordController.text;
                String username = usernameController.text;
                String email = emailController.text;
                String rank_code_ID = selectionRankstaff!.id.toString();
                String group_work = selectedGroup['character'];
                String role_id = selectionRole!.id.toString();
                String room_type_ID = selectionRoomType!.room_id.toString();
                bool status = true;
                bool result = await AdminRepo().saveAccount(
                    fullname,
                    password,
                    username,
                    email,
                    rank_code_ID,
                    group_work,
                    role_id,
                    room_type_ID,
                    status);
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
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20)),
              child: const Text(
                "Tạo user mới",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
