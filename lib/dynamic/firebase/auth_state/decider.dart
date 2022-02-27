import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:up_method_mobile_app/dynamic/firebase/auth_state/authenticate.dart';
import 'package:up_method_mobile_app/dynamic/models/auth_model.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/main_menu.dart';
import 'package:up_method_mobile_app/static/screens/custom_register.dart';
import 'package:up_method_mobile_app/static/screens/login.dart';
import 'package:up_method_mobile_app/static/screens/social_register.dart';

class Decider extends StatefulWidget {
  @override
  _DeciderState createState() => _DeciderState();
}

class _DeciderState extends State<Decider> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthModel>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return MainMenu();
    }
  }
}
