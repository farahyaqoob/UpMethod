import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';

class CustomTextField extends StatelessWidget {
  String label;
  String hint;
  String initialValue;
  TextInputType type;
  List<TextInputFormatter> inputFormatter;
  Function validator;
  ValueChanged onChanged;
  bool obscureText;
  bool readOnly;
  bool readOnlyDefault = false;
  bool obscureTextDefault = false;

  CustomTextField({
    this.initialValue,
    this.inputFormatter,
    this.onChanged,
    this.type,
    this.validator,
    this.label,
    this.hint,
    this.obscureText,
    this.readOnly,
  });

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
    return Container(
      width: width * 0.8,
      child: TextFormField(
        readOnly: readOnly == null
            ? readOnlyDefault
            : readOnly
                ? readOnly
                : readOnlyDefault,
        style: style['black13'],
        validator: validator,
        initialValue: initialValue,
        inputFormatters: inputFormatter,
        obscureText: obscureText == null ? obscureTextDefault : obscureText,
        onChanged: onChanged,
        keyboardType: type,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20),
          hintText: hint,
          labelText: label,
          labelStyle: theme.textTheme.headline5,
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: theme.primaryColorDark),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: theme.primaryColorDark),
          ),
        ),
      ),
    );
  }
}
