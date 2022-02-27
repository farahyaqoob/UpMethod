import 'package:flutter/material.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';

class CustomGridCard extends StatelessWidget {
  bool isSelected;
  VoidCallback onPressed;
  String image;
  double height;
  double width;
  CustomGridCard(
      {this.image, this.isSelected, this.onPressed, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    // --------------------------------------------------------------
    //HEIGHT-WIDTH
    // var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    //THEME
    var theme = Theme.of(context);
    var style = CustomTextStyles
        .themes[theme.brightness == Brightness.light ? "light" : "dark"];
    // ---------------------------------------------------------------
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: isSelected
            ? Center(
                child: Icon(
                  Icons.check_circle,
                  color: theme.primaryColorDark,
                  size: 50,
                ),
              )
            : Center(),
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: isSelected
                ? Border.all(color: theme.primaryColorDark, width: 4)
                : Border.all(),
            borderRadius: BorderRadius.circular(15),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.fill)),
      ),
    );
  }
}
