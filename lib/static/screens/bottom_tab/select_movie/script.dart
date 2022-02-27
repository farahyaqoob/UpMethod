import 'package:flutter/material.dart';
import 'package:up_method_mobile_app/dynamic/models/script_model.dart';
import 'package:up_method_mobile_app/dynamic/repositories/scripts_repository.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/select_movie/widgets/custom_option.dart';
import 'package:up_method_mobile_app/static/screens/loader.dart';
import 'package:up_method_mobile_app/static/utils/custom_strings.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';

class Scripts extends StatefulWidget {
  int id;
  Scripts({this.id});
  @override
  _ScriptsState createState() => _ScriptsState();
}

class _ScriptsState extends State<Scripts> {
  CustomStrings strings = CustomStrings();
  ScriptRepository _scriptRepository = ScriptRepository();
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
    return FutureBuilder(
        future: _scriptRepository.getScriptById(widget.id),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ScriptModel scriptModel = snapshot.data;
            return Scaffold(
                backgroundColor: theme.accentColor,
                appBar: AppBar(
                  backgroundColor: theme.accentColor,
                  elevation: 0,
                  leading: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios)),
                  title: Text(
                    scriptModel.title,
                    style: style['black25'],
                  ),
                  centerTitle: true,
                  actions: <Widget>[],
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15, left: 17, right: 17, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Categories',
                          style: style['black15'],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        CustomOption(
                          text: scriptModel.category.name,
                          selected: true,
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tags',
                          style: style['black15'],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            CustomOption(
                              text: scriptModel.tags[0].name,
                              selected: true,
                              onPressed: () {},
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CustomOption(
                              text: scriptModel.tags[1].name,
                              selected: true,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Script',
                          style: style['black15'],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          scriptModel.content,
                          style: style['black13'],
                        )
                      ],
                    ),
                  ),
                ));
          } else {
            return Loader(
              text: "",
            );
          }
        });
  }
}
