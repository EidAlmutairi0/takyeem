import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'KSUcolleges_page.dart';
import 'IMUcolleges_page.dart';
import 'PNUcolleges_page.dart';
import 'KSAUcolleges_page.dart';
import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      locale: Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales,
      routes: {
        "KSU": (context) => KSUCollegesPage(),
        "IMU": (context) => IMUCollegesPage(),
        "PNU": (context) => PNUCollegesPage(),
        "KSAU": (context) => KSAUCollegesPage(),
      },

      home: new HomeScreen(),
    );
  }
}
