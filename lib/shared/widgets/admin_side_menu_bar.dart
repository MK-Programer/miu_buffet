import 'package:flutter/material.dart';
import 'package:miu_food_court/providers/orders_provider.dart';
import 'package:miu_food_court/providers/product_provider.dart';
import 'package:miu_food_court/services/auth.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:provider/provider.dart';

class AdminSideBar extends StatefulWidget {
  @override
  _AdminSideBarState createState() => _AdminSideBarState();
}

class _AdminSideBarState extends State<AdminSideBar> {
  Map _navMap = {
    0: '/adminhome',
    1: '/adminaddproduct',
    2: '/editprofile',
    3: '/viewofficers',
    4: '/',
    5: '/vieworders',
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
              Icons.home_outlined,
            ),
            title: Align(
              child: Text(
                'Home',
                style: TextStyle(
                  fontSize: fontSize18,
                ),
              ),
              alignment: alignment,
            ),
            onTap: () {
              routeHandler(0);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.view_list_outlined,
            ),
            title: Align(
              child: Text(
                'View Orders',
                style: TextStyle(
                  fontSize: fontSize18,
                ),
              ),
              alignment: alignment,
            ),
            onTap: () async {
              await Provider.of<OrderProviders>(context, listen: false).load();
              routeHandler(5);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.add_shopping_cart,
            ),
            title: Align(
              child: Text(
                'Add Product',
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
              Icons.person_outline,
            ),
            title: Align(
              child: Text(
                'Edit Profile',
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
              Icons.group_outlined,
            ),
            title: Align(
              child: Text(
                'Offices',
                style: TextStyle(
                  fontSize: fontSize18,
                ),
              ),
              alignment: alignment,
            ),
            onTap: () {
              routeHandler(3);
            },
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
            onTap: () async {
              await AuthService().signout();
              await Provider.of<ProductProviders>(context, listen: false)
                  .destructList();
              routeHandler(4);
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
