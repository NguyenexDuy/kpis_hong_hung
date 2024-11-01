import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hong_hung_application/pages/log_in_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hong_hung_application/providers/staff_provider.dart';
import 'package:hong_hung_application/providers/user_provider.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => StaffProvider(),
      )
    ],
    child: DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  ));
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Color(0xff1799CE),
            foregroundColor: Colors.white,
          ),
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
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
    );
  }
}
