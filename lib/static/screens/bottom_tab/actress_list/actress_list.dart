import 'package:flutter/material.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/utils/dummy_data.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';
import 'package:up_method_mobile_app/static/widgets/textfields/custom_searchbar.dart';

class ActressList extends StatefulWidget {
  @override
  _ActressListState createState() => _ActressListState();
}

class _ActressListState extends State<ActressList> {
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
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),
            CustomSearchBar(),
            SizedBox(
              height: height * 0.02,
            ),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: persons.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          ListTile(
                            leading: Container(
                              // margin: EdgeInsets.only(
                              //     top: 5, left: 5, right: 5, bottom: 5),
                              height: height * 0.15,
                              width: width * 0.15,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(persons[i]),
                                      fit: BoxFit.fill)),
                            ),
                            title: Text(
                              name[i],
                              style: theme.textTheme.headline4,
                            ),
                            subtitle: Text(
                              noOfScripts[i],
                              style: theme.textTheme.headline5,
                            ),
                          ),
                          SizedBox(height: height * 0.03)
                        ],
                      );
                    })),
          ],
        ),
      )),
    );
  }
}
