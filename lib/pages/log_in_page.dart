import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:hong_hung_application/api/api_repo.dart';
import 'package:hong_hung_application/pages/home_page.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  APIRepository api = APIRepository();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      bool result =
          await api.login(userNameController.text, passWordController.text);
      setState(() {
        isLoading = false;
      });
      String msg = result
          ? "Đăng nhập thành công"
          : "Tài khoản hoặc mật khẩu không khớp";
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(msg)));
      }
      if (result) {
        log("LOGIN SUCCESSED");

        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                height: 320,
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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value) {
                                log("dang kiem tra");

                                if (value == null || value.isEmpty) {
                                  return "Vui lòng nhập tài khoản";
                                }
                                return null;
                              },
                              controller: userNameController,
                              decoration: InputDecoration(
                                hintText: "Tài khoản",
                                border: InputBorder.none,
                                fillColor:
                                    Colors.grey.shade200.withOpacity(0.5),
                                filled: true,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (value) {
                                log("dang kiem tra");

                                if (value == null || value.isEmpty) {
                                  return "Vui lòng nhập mật khẩu";
                                }
                                return null;
                              },
                              controller: passWordController,
                              decoration: InputDecoration(
                                hintText: "Mật khẩu",
                                border: InputBorder.none,
                                fillColor:
                                    Colors.grey.shade200.withOpacity(0.5),
                                filled: true,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ElevatedButton(
                          onPressed: () async {
                            login(context);
                          },
                          child: const Text("Đăng nhập")),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        isLoading
            ? Container(
                color: Colors.grey.withOpacity(0.4),
                child: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.primary,
                    strokeWidth: 5.0,
                  ),
                ),
              )
            : SizedBox()
      ],
    ));
  }
}
