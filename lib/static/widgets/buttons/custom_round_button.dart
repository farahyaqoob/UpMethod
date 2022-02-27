import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  Function onPressed;
  IconData icon;
  CustomRoundedButton({this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    //THEME
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Container(
          width: width * 0.16,
          height: height * 0.08,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: RaisedButton(
            elevation: 5,
            onPressed: onPressed,
            color: theme.primaryColorDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Icon(
              icon,
              color: theme.primaryColorLight,
              size: 25,
            ),
          ),
        ),
      ),
    );
  }
}
