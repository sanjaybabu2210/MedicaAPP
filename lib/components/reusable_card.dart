import 'package:flutter/material.dart';

class Reusablebutton extends StatelessWidget {
  Reusablebutton({@required this.colour, this.buttonTitle, this.onTap});

  final Color colour;
  final String buttonTitle;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        child: Center(
          child: Text(
            buttonTitle,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        margin: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [colour, Colors.pinkAccent]),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
