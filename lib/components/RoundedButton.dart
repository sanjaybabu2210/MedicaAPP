import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Color color;
  final String field;
  final Function func;

  RoundButton({this.color, this.field, this.func});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: func,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            field,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
