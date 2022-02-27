import 'package:flutter/material.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/side_menu_bar/side_menu_bar.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/utils/dummy_data.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';
import 'package:up_method_mobile_app/static/widgets/textfields/custom_searchbar.dart';

class SelectScript extends StatefulWidget {
  @override
  _SelectScriptState createState() => _SelectScriptState();
}

class _SelectScriptState extends State<SelectScript> {
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
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              CustomSearchBar(),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: height * 0.28,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(trendings[0]), fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lucy (2014)",
                        style: theme.textTheme.headline2,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.star),
                          SizedBox(width: width * 0.02),
                          Text(
                            "6.4/10 rating",
                            style: theme.textTheme.headline5,
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        "Actor ,Scifi ,Thriller",
                        style: theme.textTheme.headline5,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Text(
                            "1h 29min",
                            style: theme.textTheme.headline5,
                          ),
                          SizedBox(width: width * 0.09),
                          Icon(
                            Icons.favorite_border,
                            size: 30,
                            // color: Colors.red,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        "29 July 2014 (USA)",
                        style: theme.textTheme.headline5,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Change",
                          style: theme.textTheme.bodyText2,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                  height: height * 0.20,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: persons.length,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5.0),
                              height: height * 0.12,
                              width: width * 0.20,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: AssetImage(persons[i]),
                                      fit: BoxFit.fill)),
                            ),
                            Text(
                              name[i],
                              style: theme.textTheme.headline4,
                            ),
                          ],
                        );
                      })),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Script-256",
                    style: theme.textTheme.headline2,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: scripts.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.play_arrow_rounded,
                            size: 25,
                            color: theme.primaryColorDark,
                          ),
                          title: Text(scripts[i]),
                          trailing: Wrap(
                            spacing: width * 0.02,
                            children: [
                              Icon(Icons.favorite_outline),
                              GestureDetector(
                                  child: Container(
                                height: height * 0.03,
                                width: width * 0.05,
                                child: Image(
                                  image: AssetImage(
                                    "images/share_icon.png",
                                  ),
                                ),
                              ))
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ])),
          ),
        ));
  }
}
