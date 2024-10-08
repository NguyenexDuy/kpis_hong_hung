import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hong_hung_application/pages/dyary_person/result_assessment_manager.dart';
import 'package:hong_hung_application/pages/dyary_person/result_assessment_staff.dart';
import 'package:hong_hung_application/pages/dyary_person/result_leader_as_manager_page.dart';
import 'package:hong_hung_application/pages/dyary_person/result_manager_as_member_page.dart';
import 'package:hong_hung_application/pages/dyary_person/result_opinion_staff_page.dart';
import 'package:hong_hung_application/pages/dyary_person/result_personal_kpi.dart';
import 'package:hong_hung_application/pages/dyary_person/result_self_as_staff_page.dart';
import 'package:hong_hung_application/pages/dyary_person/result_self_assessment_dyary.dart';
import 'package:hong_hung_application/pages/dyary_person/see_superiors_reviews.dart';
import 'package:hong_hung_application/pages/home_page.dart';
import 'package:hong_hung_application/pages/kpi_group/add_kpi_room_page.dart';
import 'package:hong_hung_application/pages/kpi_group/enter_kpi_page.dart';
import 'package:hong_hung_application/pages/kpi_group/result_kpi_page.dart';
import 'package:hong_hung_application/pages/kpi_group/see_kpi_room_page.dart';
import 'package:hong_hung_application/pages/kpi_person/self_assessment.dart';
import 'package:hong_hung_application/pages/manager_system/room_manager_page.dart';
import 'package:hong_hung_application/pages/manager_system/staff_manager_page.dart';
import 'package:hong_hung_application/pages/manager_system/user_manager_page.dart';
import 'package:hong_hung_application/storage/security_storage.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.future,
    required this.fullName,
    required this.role,
  });

  final Future<void>? future;
  final String? fullName;
  final String? role;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Có lỗi xảy ra"));
            } else {
              // Kiểm tra nếu fullName và role vẫn là null
              if (fullName == null || role == null) {
                return const Center(
                    child: Text("Không thể tải thông tin người dùng"));
              }
              return ListView(
                children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context).colorScheme.primary,
                          Theme.of(context).colorScheme.secondary,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 30,
                          child: Icon(
                            Icons.person,
                            size: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          fullName!,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          role!,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.message),
                        title: const Text('Trang chủ'),
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                          );
                        },
                      ),
                      //*******************HỆ THỐNG QUẢN LÝ*****************************
                      //******************************************************************** */
                      ExpansionTile(
                        leading: const Icon(Icons.group),
                        title: const Text('Hệ Thống Quản Lý'),
                        children: <Widget>[
                          ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const UserManagerPage(),
                                    ));
                              },
                              title: const Text('Quản lý User')),
                          ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const StaffManagerPage(),
                                    ));
                              },
                              title: const Text('Quản lý Staffs')),
                          ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RoomManagerPage(),
                                    ));
                              },
                              title: const Text('Quản lý Khoa/Phòng')),
                        ],
                      ),

                      //*******************KPIS TẬP THỂ*****************************
                      //******************************************************************** */
                      ExpansionTile(
                        leading: const Icon(Icons.group),
                        title: const Text('KPIs tập thể'),
                        children: <Widget>[
                          ExpansionTile(
                            title: const Text('Quản lý chỉ số KPIs'),
                            children: [
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  size: 10,
                                ),
                                title: const Text(
                                    "Thêm mới chỉ số KPI các Khoa/Phòng"),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AddKpiRoomPage(),
                                      ));
                                },
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  size: 10,
                                ),
                                title:
                                    const Text("Xem chỉ số KPI các Khoa/Phòng"),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SeeKpiRoomPage(),
                                      ));
                                },
                              )
                            ],
                          ),
                          ExpansionTile(
                            title: const Text('Quản lý số liệu KPIs phòng'),
                            children: [
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  size: 10,
                                ),
                                title: const Text(
                                    'Nhập số liệu KPI cho Khoa/Phòng'),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const EnterKpi(),
                                      ));
                                },
                              ),
                              ListTile(
                                leading: const Icon(
                                  Icons.circle,
                                  size: 10,
                                ),
                                title: const Text(
                                    'Kết quả KPI Khoa/Phòng phụ trách'),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const ResultKpi(),
                                      ));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),

                      //***********************KPIS CÁ NHÂN*****************************
                      //******************************************************************** */
                      ExpansionTile(
                        leading: const Icon(Icons.person),
                        title: const Text('KPIs cá nhân'),
                        children: <Widget>[
                          //for manager
                          role == "Manager"
                              ? const ListTile(
                                  title: Text(
                                      'Đánh giá lãnh đạo quản lý trực tiếp'),
                                )
                              : const SizedBox(),
                          role == "Manager"
                              ? const ListTile(
                                  title: Text('Tự đánh giá bản thân'),
                                )
                              : const SizedBox(),
                          role == "Manager"
                              ? const ListTile(
                                  title: Text(
                                      'Đánh giá phó khoa/phòng hoặc ĐDT/KTYT/HST'),
                                )
                              : const SizedBox(),
                          role == "Manager"
                              ? const ListTile(
                                  title: Text(
                                      'Trưởng nhóm đánh giá các trưởng nhóm khác'),
                                )
                              : const SizedBox(),
                          role == "Manager"
                              ? const ListTile(
                                  title: Text(
                                      'Trưởng/phòng khoa, Trưởng phòng đánh giá BS/NVVP'),
                                )
                              : const SizedBox(),

                          role == "User"
                              ? ListTile(
                                  title: const Text('Kết quả tự đánh giá'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SelfAssessment(),
                                        ));
                                  },
                                )
                              : const SizedBox(),
                          role == "User"
                              ? const ListTile(
                                  title: Text('Đánh giá các cấp trên'))
                              : const SizedBox(),
                          role == "User"
                              ? const ListTile(
                                  title:
                                      Text('Các thành viên đánh giá lẫn nhau'))
                              : const SizedBox(),
                        ],
                      ),

                      //*******************NHẬT KÝ KPIS CÁ NHÂN*****************************
                      //******************************************************************** */
                      ExpansionTile(
                        leading: const Icon(Icons.my_library_books_outlined),
                        title: const Text('Nhật ký KPIs cá nhân'),
                        children: <Widget>[
                          role == "Manager"
                              ? ListTile(
                                  title: const Text(
                                      'Kết quả nhân viên tự đánh giá'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ResultSelfAsStaffPage(),
                                        ));
                                  },
                                )
                              : const SizedBox(),
                          role == "Manager"
                              ? ListTile(
                                  title:
                                      const Text('Kết quả đánh giá lãnh đạo'),
                                  onTap: () {},
                                )
                              : const SizedBox(),
                          role == "Manager"
                              ? ListTile(
                                  title: const Text('Kết quả KPI cá nhân'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ResultPersonalKpi(),
                                        ));
                                  },
                                )
                              : const SizedBox(),
                          role == "Manager"
                              ? ListTile(
                                  title: const Text(
                                      'Kết quả quản lý đánh giá nhân viên'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ResultManagerAsMemberPage(),
                                        ));
                                  },
                                )
                              : const SizedBox(),
                          ListTile(
                            title: const Text('Kết quả đánh giá cấp quản lý'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ResultAssessmentManager(),
                                  ));
                            },
                          ),
                          ListTile(
                            title: const Text('Kết quả đánh giá cấp nhân viên'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ResultAssessmentStaff(),
                                  ));
                            },
                          ),
                          role == "Manager"
                              ? ListTile(
                                  title: const Text(
                                      'Ý kiến nhân viên đánh giá lẫn nhau'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ResultOpinionStaffPage(),
                                        ));
                                  },
                                )
                              : const SizedBox(),
                          role == "User"
                              ? ListTile(
                                  title: const Text('Tự đánh giá bản thân'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SelfAssessment(),
                                        ));
                                  },
                                )
                              : const SizedBox(),
                          ListTile(
                            title: const Text('Kết quả tự đánh giá'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ResultselfassessmentDyary(
                                      role: role!,
                                    ),
                                  ));
                            },
                          ),
                          ListTile(
                            title: const Text('Xem BGĐ đánh giá'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ResultLeaderAsManagerPage(),
                                  ));
                            },
                          ),
                          role == "User"
                              ? ListTile(
                                  title: const Text('Xem cấp trên đánh giá'),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SeeSuperiorsReviews(),
                                        ));
                                  },
                                )
                              : const SizedBox(),
                        ],
                      ),
                      ListTile(
                        leading: const Icon(Icons.logout),
                        title: const Text('Đăng xuất'),
                        onTap: () async {
                          log("Thuc hien dang xuat");
                          if (Platform.isAndroid) {
                            log("voi android");
                            await SecurityStorage.clearToken();
                            SystemNavigator.pop();
                          } else if (Platform.isIOS) {
                            log("voi IOS");
                            await SecurityStorage.clearToken();

                            exit(0);
                          }
                        },
                      ),
                    ],
                  )
                ],
              );
            }
          }),
    );
  }
}
