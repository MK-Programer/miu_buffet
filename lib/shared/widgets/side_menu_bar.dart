import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  Map _navMap = {
    0: '/orders',
    1: '/faqs',
    2: '/about',
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
          /*
          ListTile(
            leading: Icon(Icons.home),
            title: Align(
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: fontSizeM,
                ),
              ),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
          
          ListTile(
            leading: Icon(Icons.person),
            title: Align(
              child: Text(
                'My Account',
                style: TextStyle(
                  fontSize: fontSizeM,
                ),
              ),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
          */
          ListTile(
            leading: Icon(
              Icons.receipt_outlined,
            ),
            title: Align(
              child: Text(
                'My orders',
                style: TextStyle(
                  fontSize: fontSizeM,
                ),
              ),
              alignment: alignment,
            ),
            onTap: () {},
          ),
          /*
          ListTile(
            leading: Icon(Icons.wallet_membership_outlined),
            title: Align(
              child: Text(
                'Wallet',
                style: TextStyle(
                  fontSize: fontSizeM,
                ),
              ),
              alignment: alignment,
            ),
            onTap: () {},
          ),
          */
          ListTile(
            leading: Icon(
              Icons.help_outline_outlined,
            ),
            title: Align(
              child: Text(
                'FAQs',
                style: TextStyle(
                  fontSize: fontSizeM,
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
              Icons.info_outline_rounded,
            ),
            title: Align(
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: fontSizeM,
                ),
              ),
              alignment: alignment,
            ),
            onTap: () {},
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
        '/orders', // got to the home and disable the back feature
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