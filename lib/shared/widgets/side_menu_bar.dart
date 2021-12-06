import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class SideBar extends StatelessWidget {
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
                'Get Help',
                style: TextStyle(
                  fontSize: fontSizeM,
                ),
              ),
              alignment: alignment,
            ),
            onTap: () {},
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
}