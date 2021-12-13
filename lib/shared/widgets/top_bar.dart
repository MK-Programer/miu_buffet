import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

// ignore: must_be_immutable
class TopBar extends StatefulWidget {
  String _title;

  TopBar([this._title = '']);

  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  bool isVisible = false;

  List _navList = [
    '/',
    '/editprofile',
    '/productlist',
    '/faqs',
  ];

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //brightness: Brightness.dark,
      title: Text(
        '${this.widget._title}',
        style: TextStyle(
          color: black,
          fontSize: fontSizeH,
        ),
      ),
      centerTitle: true,
      backgroundColor: transparent, // make back ground transparent
      elevation: 0.0, // used for shadow strength
      //change the color of the drawer icon
      iconTheme: IconThemeData(
        color: red,
      ),
      // will be used to show add to cart only in some screens
      actions: [
        Visibility(
          visible: _showHide(),
          child: IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: iconSize,
            ),
            color: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ),
      ],
    );
  }

  _showHide() {
    if (_navList.contains(ModalRoute.of(context)!.settings.name)) {
      setState(
        () {
          this.isVisible = true;
        },
      );
    } else {
      setState(
        () {
          this.isVisible = false;
        },
      );
    }
    return this.isVisible;
  }
}
