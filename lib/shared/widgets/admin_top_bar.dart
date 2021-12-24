import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

// ignore: must_be_immutable
class AdminTopBar extends StatelessWidget {
  String _title;

  AdminTopBar([this._title = '']);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //brightness: Brightness.dark,
      title: Text(
        '${this._title}',
        style: TextStyle(
          color: black,
          fontSize: fontSize20,
        ),
      ),
      centerTitle: true,
      backgroundColor: transparent, // make back ground transparent
      elevation: 0.0, // used for shadow strength
      //change the color of the drawer icon
      iconTheme: IconThemeData(
        color: red,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search_outlined,
            color: grey,
          ),
        ),
      ],
      // will be used to show add to cart only in some screens
    );
  }
}
