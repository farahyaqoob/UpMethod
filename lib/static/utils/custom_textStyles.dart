import 'package:flutter/material.dart';

class CustomTextStyles {
  static final themes = {
    //LIGHT
    'light': {
      'black20': TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'ProximaNova',
          fontWeight: FontWeight.w100),
      'black25': TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontFamily: 'ProximaNova',
          fontWeight: FontWeight.w100),
      'white13': TextStyle(
          fontSize: 13,
          color: Colors.white,
          fontFamily: 'ProximaNova',
          fontWeight: FontWeight.w100),
      'black13': TextStyle(
          fontSize: 13,
          color: Colors.black,
          fontFamily: 'ProximaNova',
          fontWeight: FontWeight.w400),
      'black15': TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontFamily: 'ProximaNova',
          fontWeight: FontWeight.w700),
      'white15': TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontFamily: 'ProximaNova',
          fontWeight: FontWeight.w700),
    },
    //-----------------------------------------------------------------
    //DARK
    'dark': {
      'black': TextStyle(fontSize: 20, color: Colors.green),
    },
  };
}
