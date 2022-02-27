import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_method_mobile_app/dynamic/bloc/auth/auth_bloc.dart';
import 'package:up_method_mobile_app/dynamic/firebase/auth_repository.dart';
import 'package:up_method_mobile_app/dynamic/local_storage/shared_preference.dart';
import 'package:up_method_mobile_app/dynamic/models/auth_model.dart';
import 'package:up_method_mobile_app/dynamic/models/user_model.dart';
import 'package:up_method_mobile_app/dynamic/repositories/user_repository.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/main_menu.dart';
import 'package:up_method_mobile_app/static/screens/loader.dart';
import 'package:up_method_mobile_app/static/screens/social_register.dart';
import 'package:up_method_mobile_app/static/utils/custom_strings.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';
import 'package:up_method_mobile_app/static/widgets/buttons/custom_button.dart';
import 'package:up_method_mobile_app/static/widgets/buttons/custom_icon_button.dart';
import 'package:up_method_mobile_app/static/widgets/custom_toast.dart';
import 'package:up_method_mobile_app/static/widgets/textfields/custom_textfields.dart';

class CustomRegister extends StatefulWidget {
  final Function toggleView;
  CustomRegister({this.toggleView});
  @override
  _CustomRegisterState createState() => _CustomRegisterState();
}

class _CustomRegisterState extends State<CustomRegister> {
  final _formKey = GlobalKey<FormState>();
  final AuthRepository authRepository = AuthRepository();
  UserRepository userRepository = UserRepository();
  CustomStrings strings = CustomStrings();
  bool loading = false;
  String email;
  String pass1;
  String pass2;
  String firstName;
  String lastName;
  String error = '';
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
    return loading
        ? Loader(
            text: '',
          )
        : Form(
            key: _formKey,
            child: Scaffold(
              backgroundColor: theme.primaryColorLight,
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                                Image.asset(
                                  'images/register.png',
                                  height: height * 0.2,
                                  width: width * 0.4,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextField(
                                  label: "First Name",
                                  validator: (val) => val.isEmpty ? '' : null,
                                  onChanged: (val) {
                                    setState(() {
                                      firstName = val;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextField(
                                  label: "Last Name",
                                  validator: (val) => val.isEmpty ? '' : null,
                                  onChanged: (val) {
                                    setState(() {
                                      lastName = val;
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextField(
                                  type: TextInputType.emailAddress,
                                  hint: "eg. abc@gmail.com",
                                  //obscureText: false,
                                  validator: (val) => val.isEmpty ? '' : null,
                                  onChanged: (val) {
                                    setState(() {
                                      email = val;
                                    });
                                  },
                                  label: "Email",
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextField(
                                  hint: "Enter 7-digit password",
                                  obscureText: false,
                                  validator: (val) =>
                                      val.length < 6 ? '' : null,
                                  onChanged: (val) {
                                    setState(() {
                                      pass1 = val;
                                    });
                                  },
                                  label: "Password",
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                CustomTextField(
                                  hint: "Enter 7-digit password",
                                  obscureText: false,
                                  validator: (val) =>
                                      val.length < 6 ? '' : null,
                                  onChanged: (val) {
                                    setState(() {
                                      pass2 = val;
                                    });
                                  },
                                  label: "Confirm Password",
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Text(
                                  error,
                                  style: TextStyle(color: Colors.red),
                                ),
                                error == ''
                                    ? Container()
                                    : SizedBox(
                                        height: height * 0.02,
                                      ),
                                CustomButton(
                                  text: "Register",
                                  onPressed: () async {
                                    if (pass1 == pass2) {
                                      if (_formKey.currentState.validate()) {
                                        // --------------------------------------------------------
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Loader(
                                                      text: '',
                                                    )));
                                        // --------------------------------------------------------
                                        dynamic result = await authRepository
                                            .registerWithEmailAndPassword(
                                                email, pass1);
                                        if (result.runtimeType == String) {
                                          Navigator.pop(context);
                                          setState(() {
                                            error = result;
                                          });
                                        } else {
                                          Navigator.pop(context);
                                          UserModel userModel = UserModel(
                                              uid: result.uid,
                                              firstName: firstName ?? '',
                                              lastName: lastName ?? '',
                                              apiKey: strings.apiKey);
                                          await userRepository
                                              .insertUser(userModel);
                                          await SharedPref()
                                              .save('register', 'register');
                                        }
                                        // --------------------------------------------------------
                                      }
                                    } else {
                                      setState(() {
                                        error =
                                            'Password length must be 7 or greater';
                                      });
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  'OR',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                CustomButton(
                                  text: "Login",
                                  onPressed: () async {
                                    widget.toggleView();
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Divider(
                                  color: theme.primaryColor,
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                CustomIconButton(
                                  image: 'images/google.png',
                                  text: "SIGN UP WITH GOOGLE",
                                  imageHeight: height * 0.035,
                                  imageWidth: width * 0.07,
                                  onPressed: () async {
                                    setState(() => loading = true);
                                    AuthModel result =
                                        await authRepository.signInWithGoogle();
                                    if (result == null) {
                                      setState(() {
                                        loading = false;
                                      });
                                      CustomToast()
                                          .showToast('Could not register');
                                    } else {
                                      await SharedPref()
                                          .save('register', 'register');
                                      UserModel userModel = UserModel(
                                          uid: result.uid,
                                          firstName: result.name,
                                          lastName: '',
                                          apiKey: strings.apiKey);
                                      await userRepository
                                          .insertUser(userModel);
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: height * 0.01,
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
                                Text(
                                  "By signing up, you are agreeing to our",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                                Text(
                                  "Terms & Conditions and Privacy Policy",
                                  style: TextStyle(
                                      color: Color(0xFFFFCC00), fontSize: 13),
                                ),
                              ]);
                        }
                        return Container();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
