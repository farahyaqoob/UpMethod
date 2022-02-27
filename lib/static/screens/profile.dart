import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:up_method_mobile_app/static/utils/custom_textStyles.dart';
import 'package:up_method_mobile_app/static/widgets/buttons/custom_button.dart';

import 'package:up_method_mobile_app/static/widgets/textfields/custom_textfields.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  //ANIMATIONS
  String name;
  @override
  void initState() {
    super.initState();
  }

  final ImagePicker _picker = ImagePicker();
  String postImageURL;
  File _postImageFile;
  //IMAGE
  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _postImageFile = File(pickedFile.path);
      } else {
        print("No image Selected");
      }
    });
  }

//----------------------------------------
  @override
  Widget build(BuildContext context) {
    //HEIGHT-WIDTH
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //THEME
    var theme = Theme.of(context);
    var style = CustomTextStyles
        .themes[theme.brightness == Brightness.light ? "light" : "dark"];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.accentColor,
        elevation: 0,
        title: Text(
          "Edit profile",
          style: style['black20'],
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.primaryColorLight,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            Center(
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                      radius: 50,
                      backgroundImage: _postImageFile != null
                          ? FileImage(_postImageFile)
                          : AssetImage("images/profile.jpg")),
                  Positioned(
                      bottom: 00.0,
                      right: 00.0,
                      child: InkWell(
                        onTap: () {
                          _getImage();
                        },
                        child: Icon(
                          Icons.camera_alt,
                          color: theme.primaryColorDark,
                          size: 28.0,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            CustomTextField(
              label: "Name",
              initialValue: "name",
            ),
            SizedBox(
              height: height * 0.03,
            ),
            CustomButton(
              text: "Confirm",
              onPressed: () async {
                Navigator.pop(context);
                return ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Profile has been updated'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
