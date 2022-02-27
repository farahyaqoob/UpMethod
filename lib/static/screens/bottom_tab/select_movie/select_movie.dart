import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_method_mobile_app/dynamic/bloc/script/script_bloc.dart';
import 'package:up_method_mobile_app/dynamic/models/all_scripts_model.dart';
import 'package:up_method_mobile_app/dynamic/repositories/scripts_repository.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/select_movie/script.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/select_movie/widgets/custom_grid_card.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/select_movie/widgets/custom_option.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/utils/dummy_data.dart';
import 'package:up_method_mobile_app/static/screens/loader.dart';
import 'package:up_method_mobile_app/static/utils/custom_strings.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';
import 'package:up_method_mobile_app/static/widgets/textfields/custom_searchbar.dart';

class SelectMovie extends StatefulWidget {
  @override
  _SelectMovieState createState() => _SelectMovieState();
}

class _SelectMovieState extends State<SelectMovie> {
  CustomStrings strings = CustomStrings();
  int id;
  bool action = true;
  bool fiction = false;
  int optionSelected = 0;
  void checkOption(int index) {
    setState(() {
      optionSelected = index;
      optionSelectedList = 0;
    });
  }

  int optionSelectedList = 0;
  void checkOptionList(int index) {
    setState(() {
      optionSelectedList = index;
      optionSelected = 0;
    });
  }

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
    return BlocBuilder<ScriptBloc, ScriptState>(
      builder: (context, state) {
        if (state is ScriptLoading) {
          return Loader(
            text: '',
          );
        } else if (state is AllScriptLoaded) {
          return Scaffold(
              floatingActionButton:
                  (optionSelected != 0 || optionSelectedList != 0)
                      ? FloatingActionButton(
                          backgroundColor: theme.primaryColorDark,
                          foregroundColor: theme.primaryColorLight,
                          child: Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Scripts(
                                          id: id,
                                        )));
                          },
                        )
                      : Container(),
              backgroundColor: theme.accentColor,
              body: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: height * 0.02,
                        ),
                        CustomSearchBar(),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          children: [
                            CustomOption(
                              text: "Trendings",
                              selected: true,
                              onPressed: () {
                                setState(() {
                                  // action = !action;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          children: [
                            for (int i = 0;
                                i < state.allScriptModel.length;
                                i++)
                              CustomGridCard(
                                height: height * 0.17,
                                width: width * 0.25,
                                image:
                                    "${strings.endPoint}${state.allScriptModel[i].poster}",
                                onPressed: () {
                                  id = state.allScriptModel[i].id;
                                  checkOptionList(i + 1);
                                },
                                isSelected: i + 1 == optionSelectedList,
                              )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        Row(
                          children: [
                            CustomOption(
                              text: "Action",
                              selected: action,
                              onPressed: () {
                                setState(() {
                                  action = !action;
                                });
                              },
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            CustomOption(
                              text: "Fiction",
                              selected: fiction,
                              onPressed: () {
                                setState(() {
                                  fiction = !fiction;
                                });
                              },
                            )
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 3,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          children: [
                            for (int i = 0;
                                i < state.allScriptModel.length;
                                i++)
                              CustomGridCard(
                                height: height * 0.17,
                                width: width * 0.25,
                                image:
                                    "${strings.endPoint}${state.allScriptModel[i].poster}",
                                onPressed: () {
                                  id = state.allScriptModel[i].id;
                                  checkOption(i + 1);
                                },
                                isSelected: i + 1 == optionSelected,
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ));
        }
        return Loader(
          text: '',
        );
      },
    );
  }
}
