import 'package:flutter/material.dart';
import 'package:miu_food_court/screens/home.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

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
      // add background color and fontfamily to whole my app
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF6F5F5),
        fontFamily: fontFamily,
      ),
      home: Home(),
    );
  }
}
