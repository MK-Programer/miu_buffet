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
    3: '/editprofile',
  };
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: transparentWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(
                  Icons.home_outlined,
                  size: iconSize,
                ),
                onPressed: () {
                  routeHandler(0);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.account_balance_wallet_outlined,
                  size: iconSize,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.person_outlined,
                  size: iconSize,
                ),
                onPressed: () async {
                  routeHandler(3);
                },
              ),
              IconButton(
                onPressed: () {
                  routeHandler(1);
                },
                icon: Icon(
                  Icons.settings_outlined,
                  size: iconSize,
                ),
              ),
            ],
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
        _navMap[id], // got to the home and disable the back feature
        (route) => false,
      );
    else if (ModalRoute.of(context)!.settings.name != _navMap[0] && id >= 0)
      Navigator.pushReplacementNamed(
        context,
        _navMap[
            id], // if i am in other page than home and go to any other page replace the previous by current
      );
    else if (ModalRoute.of(context)!.settings.name != _navMap[id])
      Navigator.pushNamed(context, _navMap[id]);
  }
}
