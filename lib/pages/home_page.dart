import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/api_repo.dart';
import 'package:hong_hung_application/models/models/user.dart';
import 'package:hong_hung_application/storage/security_storage.dart';
import 'package:hong_hung_application/widgets/drawer_widget.dart';

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
  User? user2;
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

  Future<void> getInfo() async {
    log("dang thuc hien ham lay thong tin user new");
    user2 = await SecurityStorage.getUser();
  }

  @override
  void initState() {
    super.initState();
    future = getInforUser();
    getInfo();
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
      ),
      drawer: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Có lỗi xảy ra"));
            }
            return DrawerWidget(fullName: fullName, role: role, user: user!);
          }),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.secondary,
                    spreadRadius: 5,
                    blurRadius: 30,
                    offset: const Offset(-6, -6), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary,
                    spreadRadius: 5,
                    blurRadius: 30,
                    offset: const Offset(6, 6), // changes position of shadow
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
            Text(user2?.fullname ?? "No user data available")
          ],
        ),
      ),
    );
  }
}
