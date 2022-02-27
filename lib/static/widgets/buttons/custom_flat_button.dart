import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  final TextStyle style;
  final String text;
  final Function onPressed;
  CustomFlatButton({this.style, this.text, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
        // margin: EdgeInsets.all(20),
        child: TextButton(
      child: Text(
        text,
        style: style,
      ),
      onPressed: onPressed,
    ));
  }
}
