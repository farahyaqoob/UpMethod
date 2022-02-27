import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  String text;
  Loader({this.text});

  @override
  Widget build(BuildContext context) {
    //THEME
    var theme = Theme.of(context);
    return Container(
      color: theme.accentColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SpinKitSquareCircle(
              color: theme.primaryColorDark,
              size: 60,
            ),
          ),
          Text(text,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
              )),
        ],
      ),
    );
  }
}
