

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:learning/src/core/local/shared_prefrences.dart';
import 'package:learning/src/core/services/dep_injection.dart';
import 'package:learning/src/core/utils/theme_manager.dart';
import 'package:learning/src/modules/authentication/presentation_layer/screens/forget_password.dart';
import 'package:learning/src/modules/authentication/presentation_layer/screens/main_auth.dart';
import 'package:learning/src/modules/courses/data_layer/data_sources/courses_remote_data_source.dart';
import 'package:learning/src/modules/courses/domain_layer/use_cases/get_user_usecase.dart';
import 'package:learning/src/modules/courses/presentation_layer/screens/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
await  Firebase.initializeApp();

 await  CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application

  @override
  Widget build(BuildContext context) {
 //  final double height = QueryValues.height(context);
   // final double width = QueryValues.width(context);

//CacheHelper.saveData(key: "Screen Height", value: height) ;
  //flutter clean
    // cd CacheHelper.saveData(key: "Screen Width", value: width) ;

    return MaterialApp
      (
       debugShowCheckedModeBanner: false,
      title: 'Learning',
        theme: getAppTheme(),
       home: MainScreen (),
    );
  }
}
/*
CourseDetails (course: courses [2],)
 */

