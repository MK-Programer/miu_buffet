import 'package:flutter/material.dart';
import 'package:miu_food_court/screens/home.dart';
import 'package:miu_food_court/screens/setting.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: transparentWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.home_outlined,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.person_outlined,
            ),
            onPressed: () {},
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Setting(),
                ),
              );
            },
            icon: Icon(
              Icons.settings_outlined,
            ),
          ),
        ],
      ),
    );
  }
}
