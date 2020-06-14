import 'package:colorcode/view/Main.dart';
import 'package:colorcode/view/Setting.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Color Code',
      routes: <String, WidgetBuilder>{
        '/': (_) => new Main(),
        '/setting': (_) => new Setting()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}