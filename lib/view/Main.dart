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

  String _colorCodeHex;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          canvasColor: Color.fromARGB(
              255, _ratingR.toInt(), _ratingG.toInt(), _ratingB.toInt()),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Color Code"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("#$_colorCodeHex"),
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
    _colorCodeHex = _ratingR.toInt().toRadixString(HEX) +
        _ratingG.toInt().toRadixString(HEX) +
        _ratingB.toInt().toRadixString(HEX);
  }
}
