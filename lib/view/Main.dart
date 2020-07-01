import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Preference.dart';
import 'HistoryListDialog.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  static const double INIT_COLOR = 255.0;
  static const int HEX = 16;

  var _ratingR = INIT_COLOR;
  var _ratingG = INIT_COLOR;
  var _ratingB = INIT_COLOR;

  String _colorCodeHex = "";
  TextEditingController _controller;

  Map _map;

  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController();
    setColorCodeHex(_ratingR, _ratingG, _ratingB);
    _controller.text = _colorCodeHex;
    var contentWidgets = _makeListWidgets();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            color: Color.fromARGB(
                255, _ratingR.toInt(), _ratingG.toInt(), _ratingB.toInt()),
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _controller,
                  onChanged: (e) {
                    updateColor(e);
                  },
                ),
                Text('R : $_ratingR'),
                Slider(
                  value: _ratingR,
                  activeColor: Colors.red,
                  onChanged: (newRating) {
                    setState(() => _ratingR = newRating);
                  },
                  min: 0,
                  max: 255,
                  divisions: 255,
                ),
                Text('G : $_ratingG'),
                Slider(
                  value: _ratingG,
                  activeColor: Colors.green,
                  onChanged: (newRating) {
                    setState(() => _ratingG = newRating);
                  },
                  min: 0,
                  max: 255,
                  divisions: 255,
                ),
                Text("B: $_ratingB"),
                Slider(
                  value: _ratingB,
                  activeColor: Colors.blue,
                  onChanged: (newRating) {
                    setState(() => _ratingB = newRating);
                  },
                  min: 0,
                  max: 255,
                  divisions: 255,
                ),
                OutlineButton(
                  child: Text("Archive"),
                  color: Colors.white,
                  borderSide: BorderSide(color: Colors.black),
                  onPressed: () {
                    setState(() {
                      _saveColorCode();
                    });
                  },
                ),
                OutlineButton(
                    child: Text("History"),
                    color: Colors.white,
                    borderSide: BorderSide(color: Colors.black),
                    onPressed: () async {
                      setState(() {
                        _map = Preference.getAllColorCode();
                        contentWidgets = _makeListWidgets();
                      });

                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return HistoryListDialog(contentWidgets);
                          });
                    }),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => Navigator.of(context).pushNamed("/setting"),
            tooltip: 'Increment',
            child: Icon(Icons.settings),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        ));
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  void setColorCodeHex(double r, double g, double b) {
    _colorCodeHex = decimalToHex(r.toInt()) +
        decimalToHex(g.toInt()) +
        decimalToHex(b.toInt());
  }

  void updateColor(String colorCode) {
    colorCode = colorCode.toUpperCase();
    bool isMatch = RegExp(r'[0-9A-F]{6}').hasMatch(colorCode);
    if (isMatch) {
      setState(() => updateColorValue(colorCode));
      _controller.text = _colorCodeHex;
    }
  }

  void updateColorValue(String colorCode) {
    _ratingR = int.parse("0x" + colorCode.substring(0, 2)).toDouble();
    _ratingG = int.parse("0x" + colorCode.substring(2, 4)).toDouble();
    _ratingB = int.parse("0x" + colorCode.substring(4, 6)).toDouble();
  }

  _saveColorCode() async {
    int unixTime = DateTime.now().toUtc().millisecondsSinceEpoch;
    Preference.setColorCode(_colorCodeHex, unixTime);
  }

  String decimalToHex(int decimal) {
    String hex = decimal.toRadixString(HEX);
    if (hex.length == 1) {
      hex = "0" + hex;
    }
    return hex;
  }

  List<Widget> _makeListWidgets() {
    var contentWidgets = List<Widget>();
    if (_map != null && _map.length != 0) {
      _map.forEach((key, value) {
        contentWidgets.add(Container(
          width: 200,
          height: 30,
          child: Text("#" + key),
          color: Color(int.parse("0xFF" + key)),
        ));
      });
    } else {
      contentWidgets.add(Container(
        child: Text("No History"),
      ));
    }
    return contentWidgets;
  }
}
