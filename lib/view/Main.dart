import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  var _ratingR = 0.0;
  var _ratingG = 0.0;
  var _ratingB = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Code"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }
}
