import 'package:flutter/material.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';
import 'package:up_method_mobile_app/static/widgets/buttons/custom_flat_button.dart';

import 'get_start3.dart';

class GetStart2 extends StatefulWidget {
  @override
  _GetStart2State createState() => _GetStart2State();
}

class _GetStart2State extends State<GetStart2>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
  }

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
                      -animation.value * width, 0.0, 0.0),
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
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => GetStart3()));
                                  }),
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
