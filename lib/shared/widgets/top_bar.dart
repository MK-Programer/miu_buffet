import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class TopBar extends StatelessWidget {
  final _title;
  TopBar(this._title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        '${this._title}',
        style: TextStyle(
          color: Colors.black,
          fontFamily: fontFamily,
          fontSize: fontSizeH,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent, // make back ground transparent
      elevation: 0.0, // used for shadow strength
      //change the color of the drawer icon
      iconTheme: IconThemeData(
        color: Color(0xFFA83332),
      ),
    );
  }
}