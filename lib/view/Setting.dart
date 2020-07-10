import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Column(
          children: [
            _ListItem("Application"),
            _ListItem("Oss"),
            _ListItem("PrivacyPolicy")
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
          onTap: () => _startActivity('/' + text)),
    );
  }

  _startActivity(String component) {
    Navigator.of(context).pushNamed(component);
  }
}
