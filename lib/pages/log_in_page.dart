import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/api_repo.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    APIRepository api = APIRepository();
    TextEditingController userNameController = TextEditingController();
    TextEditingController passWordController = TextEditingController();

    login() async {
      bool result =
          await api.login(userNameController.text, passWordController.text);
      if (result) {
        return "LOGIN SUCCESSED";
      } else {
        return "LOGIN FAILED";
      }
    }

    return Scaffold(
        body: Stack(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: Image.asset(
            "assets/background/bvhh4.png",
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/background/logo-hh-co-chu_fix.png",
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            onChanged: (value) {},
                            controller: userNameController,
                            decoration: InputDecoration(
                              hintText: "Tài khoản",
                              border: InputBorder.none,
                              fillColor: Colors.grey.shade200.withOpacity(0.5),
                              filled: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            onChanged: (value) {},
                            controller: passWordController,
                            decoration: InputDecoration(
                              hintText: "Mật khẩu",
                              border: InputBorder.none,
                              fillColor: Colors.grey.shade200.withOpacity(0.5),
                              filled: true,
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                          onPressed: () async {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => const HomePage(),
                            //     ));
                            login();
                          },
                          child: const Text("Đăng nhập")),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
