import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_method_mobile_app/dynamic/bloc/auth/auth_bloc.dart';
import 'package:up_method_mobile_app/dynamic/firebase/auth_repository.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/main_menu.dart';
import 'package:up_method_mobile_app/static/screens/custom_register.dart';
import 'package:up_method_mobile_app/static/screens/loader.dart';
import 'package:up_method_mobile_app/static/screens/login_screen.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';
import 'package:up_method_mobile_app/static/widgets/buttons/custom_button.dart';
import 'package:up_method_mobile_app/static/widgets/buttons/custom_icon_button.dart';

class SocialRegister extends StatefulWidget {
  final Function toggleView;
  SocialRegister({this.toggleView});
  @override
  _SocialRegisterState createState() => _SocialRegisterState();
}

class _SocialRegisterState extends State<SocialRegister> {
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
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  return ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.msg),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Column(
                    children: [
                      SizedBox(
                        height: height / 2,
                      ),
                      Loader(
                        text: '',
                      ),
                      SizedBox(
                        height: height / 2,
                      ),
                    ],
                  );
                } else if (state is AuthInitial) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Image.asset(
                          'images/register.png',
                          height: height * 0.3,
                          width: width * 0.6,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Alex! Let first make",
                              style: theme.textTheme.headline6,
                            ),
                            Text(
                              "our presence valid",
                              style: theme.textTheme.headline6,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        CustomIconButton(
                          image: 'images/google.png',
                          text: "SIGN UP WITH GOOGLE",
                          imageHeight: height * 0.035,
                          imageWidth: width * 0.07,
                          onPressed: () async {
                            BlocProvider.of<AuthBloc>(context)
                                .add(LoginWithGoogleEvent());
                          },
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        CustomIconButton(
                          image: 'images/fb.png',
                          text: "SIGN UP WITH FACEBOOK",
                          imageHeight: height * 0.035,
                          imageWidth: width * 0.07,
                          onPressed: () async {
                            BlocProvider.of<AuthBloc>(context)
                                .add(LoginWithFacebookEvent());
                          },
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        CustomButton(
                          text: "Resgister with email",
                          onPressed: () {
                            widget.toggleView();
                          },
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        CustomButton(
                          text: "Login with email",
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                        ),

                        // SizedBox(
                        //   height: height * 0.03,
                        // ),
                        // CustomIconButton(
                        //   image: 'images/apple.png',
                        //   text: "SIGN UP WITH APPLE",
                        //   imageHeight: height * 0.035,
                        //   imageWidth: width * 0.07,
                        //   onPressed: () {
                        //     Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => MainMenu()));
                        //   },
                        // ),
                        SizedBox(
                          height: height * 0.06,
                        ),
                        Text(
                          "By signing up, you are agreeing to our",
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                        Text(
                          "Terms & Conditions and Privacy Policy",
                          style:
                              TextStyle(color: Color(0xFFFFCC00), fontSize: 13),
                        ),
                      ]);
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
