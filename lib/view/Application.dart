import 'package:colorcode/PackageInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    String version = PackageInfoUtil().getAppVersion();
    return Scaffold(
      appBar: AppBar(
        title: Text("About Application"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Version ： " + version,
              style: TextStyle(fontSize: 20),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
            ),
            Image.asset("images/ic_launcher.png", height: 100, width: 100)
          ],
        ),
      ),
    );
  }
}
