import 'package:flutter/material.dart';
import 'package:hong_hung_application/pages/dyary_page.dart';
import 'package:hong_hung_application/pages/kpi_group/enter_kpi.dart';
import 'package:hong_hung_application/pages/kpi_group/result_kpi.dart';
import 'package:hong_hung_application/pages/kpi_person/self_assessment.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
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
                          title: const Text('Nhập số liệu KPI cho Khoa/Phòng'),
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
                          title: const Text('Kết quả KPI Khoa/Phòng phụ trách'),
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
                      title: const Text('Tự đánh giá bản thân'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SelfAssessment(),
                            ));
                      },
                    ),
                    ListTile(title: Text('Kết quả tự đánh giá')),
                    ListTile(title: Text('Đánh giá các cấp trên')),
                    ListTile(title: Text('Các thành viên đánh giá lẫn nhau')),
                  ],
                ),
                ExpansionTile(
                  leading: const Icon(Icons.my_library_books_outlined),
                  title: const Text('Nhật ký KPIs cá nhân'),
                  children: const <Widget>[
                    ListTile(title: Text('Kết quả tự đánh giá')),
                    ListTile(title: Text('Kết quả đánh giá cấp quản lý')),
                    ListTile(title: Text('Kết quả đánh giá cấp nhân viên')),
                    ListTile(title: Text('Xem cấp trên đánh giá')),
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
        ),
      ),
      body: Center(
        child: Text("This is home page"),
      ),
    );
  }
}
