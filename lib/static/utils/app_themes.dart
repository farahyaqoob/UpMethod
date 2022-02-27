import 'package:flutter/material.dart';

enum darkOrLight { lightTheme, darkTheme }

class AppThemes {
  static final themes = {
    darkOrLight.lightTheme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.white,
        primaryColor: Colors.grey,
        primaryColorDark: Color(0xFFFFCC00),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          //HEADING LARGE
          headline1: TextStyle(
              color: Colors.grey[700],
              fontSize: 31,
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w100),
          //HEADING MEDIUM
          headline2: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w600),

          //GREEN TEXT
          headline3: TextStyle(
              color: Color(0xFFFFCC00),
              fontSize: 18,
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w800),

          // WHITE TEXT
          headline4: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w700),

          //BLACK TEXT
          headline5: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: "ProximaNova",
              fontWeight: FontWeight.w500),

          //BODY TEXT 1
          bodyText1: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w500),

          //BODY TEXT 2
          bodyText2: TextStyle(
              color: Color(0xFFFFCC00),
              fontSize: 15,
              fontFamily: 'ProximaNova',
              fontWeight: FontWeight.w500),

          //BODY TEXT 3
          headline6: TextStyle(
            fontFamily: 'ProximaNova',
            color: Colors.grey,
            fontSize: 23,
          ),
        )),
  };

  static TextStyle display5(BuildContext context) {
    return Theme.of(context).textTheme.display4.copyWith(fontSize: 192.0);
  }
}
