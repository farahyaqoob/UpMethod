import 'package:flutter/material.dart';
import 'package:up_method_mobile_app/dynamic/local_storage/shared_preference.dart';
import 'package:up_method_mobile_app/dynamic/models/user_model.dart';
import 'package:up_method_mobile_app/dynamic/repositories/scripts_repository.dart';
import 'package:up_method_mobile_app/dynamic/repositories/user_repository.dart';
import 'package:up_method_mobile_app/static/screens/get_start2.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';
import 'package:up_method_mobile_app/static/widgets/buttons/custom_flat_button.dart';

class GetStart1 extends StatefulWidget {
  @override
  _GetStart1State createState() => _GetStart1State();
}

class _GetStart1State extends State<GetStart1>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  ScriptRepository _scriptRepository = ScriptRepository();
  UserRepository userRepository = UserRepository();
  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
  }

  SharedPref sharedPref = SharedPref();

  @override
  Widget build(BuildContext context) {
    // --------------------------------------------------------------
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //THEME
    var theme = Theme.of(context);
    var style = CustomTextStyles
        .themes[theme.brightness == Brightness.light ? "light" : "dark"];
    // ---------------------------------------------------------------
    return Scaffold(
      backgroundColor: theme.primaryColorLight,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 10),
          child: AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform: Matrix4.translationValues(
                    -animation.value * width,
                    0.0,
                    0.0,
                  ),
                  child: Column(
                    children: [
                      Column(children: [
                        Image.asset(
                          'images/login.png',
                          height: height * 0.45,
                          width: width,
                          fit: BoxFit.fitHeight,
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Text(
                          "Lorem Ipsum",
                          style: theme.textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Lorem ipsum dolar sit amet",
                          style: style['black25'],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "consectetur adipiscing elit",
                          style: style['black25'],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Text(
                          "Aenean dapibus sem id",
                          style: style['black25'],
                        ),
                        SizedBox(
                          height: height * 0.06,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomFlatButton(
                                style: theme.textTheme.bodyText2,
                                text: 'Skip',
                              ),
                              CustomFlatButton(
                                  style: theme.textTheme.headline3,
                                  text: 'Next',
                                  onPressed: () async {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GetStart2()));
                                  })
                            ])
                      ]),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
