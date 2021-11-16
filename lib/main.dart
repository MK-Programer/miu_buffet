import 'package:flutter/material.dart';
import 'package:miu_food_court/screens/home.dart';
import 'package:miu_food_court/screens/setting.dart';
import 'package:miu_food_court/screens/sign_in.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MIU Food Court',
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/setting': (context) => Setting(),
        '/signin': (context) => Signin(),
      },
    );
  }
}
