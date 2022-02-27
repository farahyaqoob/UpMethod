import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
import 'package:up_method_mobile_app/dynamic/firebase/auth_repository.dart';
import 'package:up_method_mobile_app/dynamic/models/user_model.dart';
import 'package:up_method_mobile_app/dynamic/models/user_response.dart';
import 'package:up_method_mobile_app/static/utils/custom_strings.dart';

class UserRepository {
  CustomStrings strings = CustomStrings();
  AuthRepository authRepository = AuthRepository();

  Future<UserResponse> getUser() async {
    User user = await authRepository.getCurrentFirebaseUser();
    Response response =
        await get(Uri.parse("${strings.endPoint}/users/${user.uid}"), headers: {
      'content-type': 'application/json',
      'api-key': strings.apiKey
    });
    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      dynamic data = body['data'];
      UserResponse userResponse = UserResponse.fromJson(data);
      print(userResponse);
      return userResponse;
    } else {
      print('no user model');
    }
  }

  Future insertUser(UserModel userModel) async {
    dynamic userEncode = jsonEncode(userModel);
    Response response = await post(Uri.parse("${strings.endPoint}/add-user"),
        body: userEncode,
        headers: {
          'content-type': 'application/json',
          'api-key': strings.apiKey
        });
    if (response.statusCode == 200) {
      print('User inserted');
    } else {
      print('no user model');
    }
  }
}
