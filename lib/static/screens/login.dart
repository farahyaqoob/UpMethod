import 'package:flutter/material.dart';
import 'package:up_method_mobile_app/static/screens/custom_register.dart';
import 'package:up_method_mobile_app/static/screens/social_register.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';
import 'package:up_method_mobile_app/static/widgets/buttons/custom_button.dart';
import 'package:up_method_mobile_app/static/widgets/buttons/custom_round_button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: theme.textTheme.bodyText1,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomRegister()));
                        },
                        child: Text(
                          "Login",
                          style: theme.textTheme.bodyText2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Image.asset(
                    'images/login.png',
                    height: height * 0.4,
                    width: width * 0.7,
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "I m your AI friend. What you",
                        style: theme.textTheme.headline6,
                      ),
                      Text(
                        "want to call me?",
                        style: theme.textTheme.headline6,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  CustomButton(text: "Alex", onPressed: () {}),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  CustomRoundedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SocialRegister()));
                    },
                    icon: Icons.arrow_forward_ios,
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
