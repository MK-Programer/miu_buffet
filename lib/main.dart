import 'package:flutter/material.dart';
import 'package:miu_food_court/screens/home.dart';
import 'package:miu_food_court/screens/setting.dart';
import 'package:miu_food_court/screens/sign_in.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MIU Food Court',
      // add background color and font-family to whole my app
      theme: ThemeData(
        scaffoldBackgroundColor: transparentWhite,
        fontFamily: fontFamily,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/setting': (context) => Setting(),
        '/signin': (context) => SignIn(),
      },
    );
  }
}