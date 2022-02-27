import 'package:flutter/material.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';

class CustomSearchBar extends StatelessWidget {
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
    return Center(
      child: Container(
        width: width,
        height: height * 0.06,
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(30)),
        child: TextFormField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 30),
              hintText: " Search...",
              border: InputBorder.none,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: Icon(Icons.search),
                  color: theme.scaffoldBackgroundColor,
                  onPressed: () {},
                ),
              )),
          style: style['black13'],
        ),
      ),
    );
  }
}
