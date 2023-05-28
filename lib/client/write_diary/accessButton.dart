import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class accessButton extends StatefulWidget {
  State<StatefulWidget> createState() => _accessButton();
}

class _accessButton extends State{
  String _buttonState = "OFF";
  var _color = Colors.black;
  var _icon = Icon(Icons.favorite_border);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: _icon,
        color: _color,
        onPressed: () { changeColor(); },
      ),
    );
  }
  void changeColor() {
    setState(() {
      if(_buttonState == "OFF") {
        _color = Colors.red;
        _icon = Icon(Icons.favorite);
        _buttonState = "ON";
      } else {
        _color = Colors.black;
        _icon = Icon(Icons.favorite_border);
        _buttonState = "OFF";
      }
    });
  }
}