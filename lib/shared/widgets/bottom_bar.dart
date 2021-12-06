import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  Map _navMap = {
    0: '/',
    1: '/setting',
    2: '/signin',
  };
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
              routeHandler(0);
            },
          ),
          IconButton(
            icon: Icon(
              Icons.account_balance_wallet_outlined,
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
              routeHandler(1);
            },
            icon: Icon(
              Icons.settings_outlined,
            ),
          ),
        ],
      ),
    );
  }

  // routes handler
  void routeHandler(int id) {
    if (ModalRoute.of(context)!.settings.name == _navMap[id])
      return;
    else if (ModalRoute.of(context)!.settings.name != _navMap[0] && id == 0)
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/', // got to the home and disable the back feature
        (route) => false,
      );
    else if (ModalRoute.of(context)!.settings.name != _navMap[id])
      Navigator.pushNamed(context, _navMap[id]);
  }
}