import 'dart:convert';

import 'package:http/http.dart';
import 'package:up_method_mobile_app/dynamic/models/all_scripts_model.dart';
import 'package:up_method_mobile_app/dynamic/models/script_model.dart';
import 'package:up_method_mobile_app/static/utils/custom_strings.dart';

class ScriptRepository {
  CustomStrings strings = CustomStrings();
  Future<List<AllScriptModel>> getAllScripts() async {
    Response response = await get(Uri.parse('${strings.endPoint}/scripts'),
        headers: {
          'content-type': 'application/json',
          'api-key': strings.apiKey
        });
    if (response.body.isNotEmpty) {
      dynamic body = jsonDecode(response.body);
      List<dynamic> script = body['data'];
      List<AllScriptModel> allScriptModel =
          script.map((dynamic e) => AllScriptModel.fromJson(e)).toList();
      print(allScriptModel);
      return allScriptModel;
    } else {
      print('no scrpts');
    }
  }

  Future<ScriptModel> getScriptById(int id) async {
    Response response = await get(Uri.parse('${strings.endPoint}/scripts/$id'),
        headers: {
          'content-type': 'application/json',
          'api-key': strings.apiKey
        });
    if (response.statusCode == 200) {
      dynamic body = jsonDecode(response.body);
      dynamic script = body['data'];
      ScriptModel scriptModel = ScriptModel.fromJson(script);
      print(scriptModel);
      return scriptModel;
    } else {
      print('no script of this id');
    }
  }
}
