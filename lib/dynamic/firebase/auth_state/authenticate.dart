import 'package:flutter/material.dart';
import 'package:up_method_mobile_app/static/screens/custom_register.dart';
import 'package:up_method_mobile_app/static/screens/login_screen.dart';
import 'package:up_method_mobile_app/static/screens/social_register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignInWithSocial = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignInWithSocial = !showSignInWithSocial);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInWithSocial) {
      return LoginScreen(toggleView: toggleView);
    } else {
      return CustomRegister(toggleView: toggleView);
    }
  }
}
