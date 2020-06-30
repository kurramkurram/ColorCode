import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryListDialog extends StatefulWidget {
  var _contentWidgets;

  HistoryListDialog(var contentWidgets) {
    print("HistoryListDialog");
    _contentWidgets = contentWidgets;
  }

  @override
  _HistoryListDialogState createState() =>
      _HistoryListDialogState(_contentWidgets);
}

class _HistoryListDialogState extends State<HistoryListDialog> {
  var _contentWidgets;

  _HistoryListDialogState(var contentWidgets) {
    print("_HistoryListDialogState");
    _contentWidgets = contentWidgets;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("History"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: _contentWidgets,
        ),
        actions: <Widget>[
//          FlatButton(onPressed: () => _clearColorCode(), child: Text("clear")),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("cancel"))
        ]);
  }
}
