import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hong_hung_application/pages/dyary_page.dart';
import 'package:hong_hung_application/pages/kpis_group_page.dart';
import 'package:hong_hung_application/pages/kpis_person_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  _loadPage(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 2:
        return KpisGroupPage();
      case 3:
        return KpisPersonPage();
      case 4:
        return DyaryPage();
      default:
        break;
    }
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
      drawer: Drawer(
        child: ListView(
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
                  Text("Nguyễn Duy"),
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Trang chủ'),
                  onTap: () {
                    Navigator.pop(context);
                    _selectedIndex = 0;
                    setState(() {});
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.group),
                  title: const Text('KPIs tập thể'),
                  onTap: () {
                    Navigator.pop(context);
                    _selectedIndex = 1;
                    setState(() {});
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text('KPIs cá nhân'),
                  onTap: () {
                    Navigator.pop(context);
                    _selectedIndex = 2;
                    setState(() {});
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.my_library_books_outlined),
                  title: const Text('Nhật ký KPIs cá nhân'),
                  onTap: () {
                    Navigator.pop(context);
                    _selectedIndex = 3;
                    setState(() {});
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Đăng xuất'),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
      ),
      body: _loadPage(_selectedIndex),
    );
  }
}
