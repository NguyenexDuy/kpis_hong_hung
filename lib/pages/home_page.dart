import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/api_repo.dart';
import 'package:hong_hung_application/models/models/user.dart';
import 'package:hong_hung_application/pages/dyary_person/result_assessment_manager.dart';
import 'package:hong_hung_application/pages/dyary_person/result_assessment_staff.dart';
import 'package:hong_hung_application/pages/dyary_person/result_leader_as_manager_page.dart';
import 'package:hong_hung_application/pages/dyary_person/result_personal_kpi.dart';
import 'package:hong_hung_application/pages/dyary_person/result_self_as_staff_page.dart';
import 'package:hong_hung_application/pages/dyary_person/result_self_assessment_dyary.dart';
import 'package:hong_hung_application/pages/dyary_person/see_superiors_reviews.dart';
import 'package:hong_hung_application/pages/kpi_group/enter_kpi.dart';
import 'package:hong_hung_application/pages/kpi_group/result_kpi.dart';
import 'package:hong_hung_application/pages/kpi_person/self_assessment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List image = [
    'assets/background/bvhh1.png',
    'assets/background/bvhh5.png',
    'assets/background/bvhh2.png',
    'assets/background/bvhh4.png',
  ];
  User? user;
  String? fullName;
  String? role;
  Future<void>? future;

  Future<void> getInforUser() async {
    log("Dang vao ham lay thong tin user");
    user = await APIRepository().getInformation();
    setState(() {
      fullName = user!.fullname;
      role = user!.role[0].roleName;
    });
    log("da lay xong ");
  }

  @override
  void initState() {
    super.initState();
    future = getInforUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          "BỆNH VIỆN ĐA KHOA HỒNG HƯNG",
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      ),
      drawer: NewWidget(future: future, fullName: fullName, role: role),
      // body: ListView.builder(
      //   itemCount: image.length,
      //   itemBuilder: (context, index) {
      //     return Image.asset(image[index]);
      //   },
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.secondary,
                spreadRadius: 5,
                blurRadius: 30,
                offset: Offset(-6, -6), // changes position of shadow
              ),
              BoxShadow(
                color: Theme.of(context).colorScheme.primary,
                spreadRadius: 5,
                blurRadius: 30,
                offset: Offset(6, 6), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/background/bvhh1.png",
              fit: BoxFit.cover, // Điều chỉnh để ảnh vừa với container
            ),
          ),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
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
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 30,
                          child: Icon(
                            Icons.person,
                            size: 40,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          fullName!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        Text(
                          role!,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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
                      ExpansionTile(
                        leading: const Icon(Icons.group),
                        title: const Text('KPIs tập thể'),
                        children: <Widget>[
                          const ListTile(title: Text('Quản lý chỉ số KPIs')),
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
                      ExpansionTile(
                        leading: const Icon(Icons.person),
                        title: const Text('KPIs cá nhân'),
                        children: <Widget>[
                          ListTile(
                            title: const Text('Kết quả tự đánh giá'),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SelfAssessment(),
                                  ));
                            },
                          ),
                          const ListTile(title: Text('Đánh giá các cấp trên')),
                          const ListTile(
                              title: Text('Các thành viên đánh giá lẫn nhau')),
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
                                  onTap: () {},
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
                                  onTap: () {},
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
                        onTap: () {},
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
