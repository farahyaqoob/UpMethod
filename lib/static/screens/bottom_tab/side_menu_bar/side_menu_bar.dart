import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_method_mobile_app/dynamic/bloc/auth/auth_bloc.dart';
import 'package:up_method_mobile_app/dynamic/bloc/user/user_bloc.dart';
import 'package:up_method_mobile_app/dynamic/firebase/auth_repository.dart';
import 'package:up_method_mobile_app/dynamic/firebase/auth_state/collector.dart';
import 'package:up_method_mobile_app/dynamic/models/auth_model.dart';
import 'package:up_method_mobile_app/dynamic/repositories/user_repository.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/utils/dummy_data.dart';
import 'package:up_method_mobile_app/static/screens/loader.dart';
import 'package:up_method_mobile_app/static/screens/profile.dart';
import 'package:up_method_mobile_app/static/widgets/textfields/custom_searchbar.dart';

class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  AuthRepository _auth = AuthRepository();
  UserRepository userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //THEME
    var theme = Theme.of(context);
    return Drawer(
      child: StreamBuilder(
          stream: _auth.getUserForState,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DrawerHeader(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            snapshot.data.photo == null
                                ? Center(
                                    child: CircleAvatar(
                                      radius: width * 0.11,
                                      backgroundImage: AssetImage(
                                        'images/profile.jpg',
                                      ),
                                      //  Image.asset(
                                      //   persons[0],
                                      //   height: height * 0.1,
                                      //   fit: BoxFit.fill,
                                      // ),
                                    ),
                                  )
                                : Center(
                                    child: Container(
                                      height: height * 0.11,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              snapshot.data.photo,
                                            ),
                                          )),
                                      // child: Image.network(
                                      //   snapshot.data.photo,
                                      //   height: height * 0.1,
                                      //   fit: BoxFit.fill,
                                      // ),
                                    ),
                                  ),
                            SizedBox(
                              height: height * 0.02,
                            ),
                            BlocBuilder<UserBloc, UserState>(
                                builder: (context, state) {
                              if (state is UserLoaded) {
                                return Center(
                                  child: Text(
                                    "${state.userResponse.firstName} ${state.userResponse.lastName}",
                                    style: theme.textTheme.headline4,
                                  ),
                                );
                              }
                              return Text('');
                            })
                            // FutureBuilder(
                            //     future: userRepository.getUser(),
                            //     builder: (context, snapshots) {
                            //       if (snapshots.hasData) {
                            //         return Center(
                            //           child: Text(
                            //             "${snapshots.data.firstName} ${snapshots.data.lastName}",
                            //             style: theme.textTheme.headline4,
                            //           ),
                            //         );
                            //       } else {
                            //         return Center(
                            //             child: Text(
                            //           snapshot.data.name ?? '',
                            //           style: theme.textTheme.headline4,
                            //         ));
                            //       }
                            //     }),
                          ],
                        ),
                      ),
                    ],
                  )),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: CustomSearchBar(),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: theme.primaryColorDark,
                    ),
                    title: Text(
                      'My Profile',
                      style: theme.textTheme.headline4,
                    ),
                    onTap: () => {},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.person_pin_circle,
                      color: theme.primaryColorDark,
                    ),
                    title: Text(
                      'Audience',
                      style: theme.textTheme.headline4,
                    ),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.favorite,
                      color: theme.primaryColorDark,
                    ),
                    title: Text(
                      'Favourities',
                      style: theme.textTheme.headline4,
                    ),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: theme.primaryColorDark,
                    ),
                    title: Text(
                      'Settings',
                      style: theme.textTheme.headline4,
                    ),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.help,
                      color: theme.primaryColorDark,
                    ),
                    title: Text(
                      'Help',
                      style: theme.textTheme.headline4,
                    ),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.privacy_tip,
                      color: theme.primaryColorDark,
                    ),
                    title: Text(
                      'Privacy Policy',
                      style: theme.textTheme.headline4,
                    ),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                    onTap: () async {
                      logoutAlertDialog();
                      // await _auth.signOutWithFacebook();
                      // await _auth.signOutWithGoogle();

                      // Navigator.pop(context);
                    },
                  ),
                ],
              );
            } else {
              return Loader(
                text: '',
              );
            }
          }),
    );
  }

  Future<void> logoutAlertDialog() async {
    return showDialog(
        context: context,
        builder: (c) {
          return AlertDialog(
            title: const Text(
              'Logout',
              style: TextStyle(
                color: Color(0xFFFFCC00),
              ),
            ),
            content: Text("Are you sure you wanna logout?"),
            actions: [
              Row(
                children: [
                  TextButton(
                    child: const Text(
                      'cancel',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: const Text(
                      'yes, logout',
                      style: TextStyle(color: Color(0xFFFFCC00)),
                    ),
                    onPressed: () async {
                      await _auth.signOut();
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          );
        });
  }
}
