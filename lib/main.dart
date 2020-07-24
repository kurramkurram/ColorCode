import 'package:colorcode/PackageInfo.dart';
import 'package:colorcode/Preference.dart';
import 'package:colorcode/view/Application.dart';
import 'package:colorcode/view/Main.dart';
import 'package:colorcode/view/PrivacyPolicy.dart';
import 'package:colorcode/view/Setting.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Preference.init();
    PackageInfoUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (_) => Main(),
        '/setting': (_) => Setting(),
        '/Application': (_) => Application(),
        '/PrivacyPolicy': (_) => PrivacyPolicy()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
