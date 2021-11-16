import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent, // make back ground transparent
      elevation: 0.0, // used for shadow strength
      //change the color of the drawer icon
      iconTheme: IconThemeData(
        color: Color(0xFFA83332),
      ),
    );
  }
}
