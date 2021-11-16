import 'package:flutter/material.dart';
import 'package:miu_food_court/screens/home.dart';

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
      },
    );
  }
}
