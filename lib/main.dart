import 'package:flutter/material.dart';
import 'package:miu_food_court/screens/edit_profile.dart';
import 'package:miu_food_court/screens/help.dart';
import 'package:miu_food_court/screens/home.dart';
import 'package:miu_food_court/screens/product_list.dart';
import 'package:miu_food_court/screens/setting.dart';
import 'package:miu_food_court/screens/sign_in.dart';
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
        '/editprofile': (context) => EditProfile(),
        '/productlist': (context) => ProductList(),
        '/faqs': (context) => FAQs(),
      },
    );
  }
}