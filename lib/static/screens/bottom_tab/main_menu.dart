import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_method_mobile_app/dynamic/bloc/script/script_bloc.dart';
import 'package:up_method_mobile_app/dynamic/bloc/user/user_bloc.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/actress_list/actress_list.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/select_movie/select_movie.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/select_script/select_script.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/side_menu_bar/side_menu_bar.dart';
import 'package:up_method_mobile_app/static/screens/profile.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ScriptBloc>(context).add(GetAllScriptEvent());
    BlocProvider.of<UserBloc>(context).add(GetUserEvent());
  }

  List screens = [SelectMovie(), ActressList(), SelectScript()];
  int pages = 0;
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
      backgroundColor: theme.accentColor,
      drawer: NavDrawer(),
      appBar: AppBar(
        backgroundColor: theme.accentColor,
        elevation: 0,
        title: Text(
          pages == 0
              ? "Select Movie"
              : pages == 1
                  ? 'Select Actor'
                  : 'Select Script',
          style: style['black20'],
        ),
        centerTitle: true,
        // actions: <Widget>[
        //   GestureDetector(
        //     onTap: () {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => Profile()));
        //     },
        //     child: Container(
        //       margin: EdgeInsets.all(5),
        //       height: height * 0,
        //       width: width * 0.09,
        //       decoration: BoxDecoration(
        //           shape: BoxShape.circle,
        //           image: DecorationImage(
        //               image: AssetImage('images/profile.jpg'),
        //               fit: BoxFit.fitWidth)),
        //     ),
        //   )
        // ],
      ),
      body: screens[pages],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          backgroundColor: theme.primaryColorLight,
          selectedIconTheme:
              IconThemeData(color: theme.primaryColorDark, size: 40),
          unselectedIconTheme:
              IconThemeData(color: theme.scaffoldBackgroundColor),
          elevation: 40,
          currentIndex: pages,
          onTap: (int index) {
            setState(() {
              pages = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.pageview), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_fill_outlined), label: ""),
          ],
        ),
      ),
      // body:
    );
  }
}
