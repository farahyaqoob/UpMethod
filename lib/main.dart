import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:up_method_mobile_app/dynamic/bloc/auth/auth_bloc.dart';
import 'package:up_method_mobile_app/dynamic/bloc/script/script_bloc.dart';
import 'package:up_method_mobile_app/dynamic/bloc/user/user_bloc.dart';
import 'package:up_method_mobile_app/dynamic/firebase/auth_state/collector.dart';
import 'package:up_method_mobile_app/dynamic/local_storage/shared_preference.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/main_menu.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/actress_list/actress_list.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/select_movie/select_movie.dart';
import 'package:up_method_mobile_app/static/screens/bottom_tab/select_script/select_script.dart';
import 'package:up_method_mobile_app/static/screens/custom_register.dart';
import 'package:up_method_mobile_app/static/screens/get_start1.dart';
import 'package:up_method_mobile_app/static/screens/login.dart';
import 'package:up_method_mobile_app/static/utils/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ScriptBloc()),
        BlocProvider(create: (context) => UserBloc()),
      ],
      child: MaterialApp(
        title: 'Up Method',
        theme: AppThemes.themes[darkOrLight.lightTheme],
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: SharedPref().read('register'),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return GetStart1();
              } else {
                return Collector();
              }
            }),
      ),
    );
  }
}
