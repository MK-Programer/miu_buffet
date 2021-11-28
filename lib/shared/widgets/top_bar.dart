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
      //actions: [
      //  Visibility(
      //    visible: _showHide(),
      //    child: IconButton(
      //      icon: Icon(Icons.shopping_cart),
      //      color: Colors.black,
      //      onPressed: () {},
      //    ),
      //  ),
      //],
    );
  }

  //_showHide() {
  //  if (ModalRoute.of(context)!.settings.name == '/') {
  //    setState(
  //      () {
  //        this.isVisible = false;
  //      },
  //    );
  //  } else {
  //    setState(
  //      () {
  //        this.isVisible = true;
  //      },
  //    );
  //  }
  //  return this.isVisible;
  //}
}
