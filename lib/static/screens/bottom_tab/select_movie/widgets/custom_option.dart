import 'package:flutter/material.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';

class CustomOption extends StatelessWidget {
  String text;
  bool selected;
  Function onPressed;
  CustomOption({this.text, this.selected, this.onPressed});
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
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: height * 0.05,
        width: width * 0.27,
        child: Text(
          text,
          style: selected ? style['white15'] : style['black15'],
        ),
        decoration: BoxDecoration(
          color: selected ? theme.primaryColorDark : Colors.grey[300],
          borderRadius: BorderRadius.circular(200),
        ),
      ),
    );
  }
}
