import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:up_method_mobile_app/dynamic/firebase/auth_repository.dart';
import 'package:up_method_mobile_app/dynamic/firebase/auth_state/decider.dart';
import 'package:up_method_mobile_app/dynamic/models/auth_model.dart';

class Collector extends StatefulWidget {
  @override
  _CollectorState createState() => _CollectorState();
}

class _CollectorState extends State<Collector> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AuthModel>.value(
      initialData: null,
      value: AuthRepository().getUserForState,
      child: Decider(),
    );
  }
}
