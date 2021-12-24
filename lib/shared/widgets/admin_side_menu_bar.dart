import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class AdminSideBar extends StatelessWidget {
  const AdminSideBar({Key? key}) : super(key: key);

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
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.group_outlined,
            ),
            title: Align(
              child: Text(
                'Officers',
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
