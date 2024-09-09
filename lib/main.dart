import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hong_hung_application/pages/log_in_page.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(), // Wrap your app
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xff1799CE),
              onPrimary: Color(0xFFFFFFFF),
              secondary: Color(0xff00A85A),
              onSecondary: Color(0xFF000000),
              error: Colors.red,
              onError: Color(0xFF000000),
              surface: Color(0xFFFFFFFF),
              onSurface: Color(0xFF000000))),
      home: const LogIn(),
    );
  }
}
