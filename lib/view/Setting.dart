import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  static const oss = "OSS";
  static const application = "Application";
  static const privacyPolicy = "PrivacyPolicy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Column(
          children: [
            _ListItem(application),
            _ListItem(oss),
            _ListItem(privacyPolicy)
          ],
        ),
      ),
    );
  }

  Widget _ListItem(String text) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: ListTile(
          title: Text(
            text,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
          onTap: () {
            switch (text) {
              case oss:
                showLicensePage(context: context);
                break;

              default:
                _startActivity("/" + text);
                break;
            }
          }),
    );
  }

  _startActivity(String component) {
    Navigator.of(context).pushNamed(component);
  }
}
