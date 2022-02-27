import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Function onPressed;
  String text;
  CustomButton({this.onPressed, this.text});

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
          width: width * 0.7,
          height: height * 0.085,
          child: RaisedButton(
            elevation: 0.0,
            onPressed: onPressed,
            color: Colors.grey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14.0),
            ),
            child: Text(text,
                style: TextStyle(
                    fontSize: 14, color: theme.scaffoldBackgroundColor)),
          ),
        ),
      ),
    );
  }
}
