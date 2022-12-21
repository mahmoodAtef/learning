import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learning/src/core/local/shared_prefrences.dart';
import 'package:learning/src/core/services/dep_injection.dart';
import 'package:learning/src/core/utils/theme_manager.dart';
import 'package:learning/src/modules/courses/presentation_layer/screens/main_screen.dart';


void main() async {
String v  = "https://www.youtube.com/watch?v=";
print('v : ${v.length}');
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

