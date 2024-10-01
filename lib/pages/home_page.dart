import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/api_repo.dart';
import 'package:hong_hung_application/models/models/user.dart';
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
      ),
      drawer: DrawerWidget(future: future, fullName: fullName, role: role),
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
