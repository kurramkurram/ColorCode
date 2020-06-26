import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    _controller = TextEditingController();
    setColorCodeHex(_ratingR, _ratingG, _ratingB);
    _controller.text = _colorCodeHex;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Color Code"),
          ),
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
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed("/setting");
            },
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

  String decimalToHex(int decimal) {
    String hex = decimal.toRadixString(HEX);
    if (hex.length == 1) {
      hex = "0" + hex;
    }
    return hex;
  }
}
