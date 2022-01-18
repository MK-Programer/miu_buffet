import 'package:flutter/material.dart';
import 'package:miu_food_court/services/auth.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final AuthService _auth = AuthService();
  Map _navMap = {
    0: '/',
    1: '/order',
    2: '/faqs',
    3: '/about',
    4: '/fav',
  };
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 50.0),
        children: [
          DrawerHeader(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/pictures/miu-logo.png'),
                  fit: BoxFit.scaleDown,
                ),
              ),
              child: null,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.receipt_outlined,
            ),
            title: Align(
              child: Text(
                'My orders',
                style: TextStyle(
                  fontSize: fontSize18,
                ),
              ),
              alignment: alignment,
            ),
            onTap: () {
              routeHandler(1);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.favorite,
            ),
            title: Align(
              child: Text(
                'Favourite',
                style: TextStyle(
                  fontSize: fontSize18,
                ),
              ),
              alignment: alignment,
            ),
            onTap: () {
              routeHandler(4);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.help_outline_outlined,
            ),
            title: Align(
              child: Text(
                'FAQs',
                style: TextStyle(
                  fontSize: fontSize18,
                ),
              ),
              alignment: alignment,
            ),
            onTap: () {
              routeHandler(2);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline_rounded,
            ),
            title: Align(
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: fontSize18,
                ),
              ),
              alignment: alignment,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.logout_outlined,
            ),
            title: Align(
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: fontSize18,
                ),
              ),
              alignment: alignment,
            ),
            onTap: () {
              _auth.signout();
            },
          ),
        ],
      ),
    );
  }

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
            id], // if i am in other page than orders and go to any other page replace the previous by current
      );
    else if (ModalRoute.of(context)!.settings.name != _navMap[id])
      Navigator.pushNamed(context, _navMap[id]);
  }
}
