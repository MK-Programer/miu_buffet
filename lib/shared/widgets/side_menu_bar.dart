import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 50.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/setting');
                },
                icon: Icon(Icons.settings),
              ),
            ],
          ),
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
              Navigator.pushNamed(context, '/');
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
          ListTile(
            leading: Icon(Icons.receipt),
            title: Align(
              child: Text(
                'My orders',
                style: TextStyle(
                  fontSize: fontSizeM,
                ),
              ),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.wallet_membership),
            title: Align(
              child: Text(
                'Wallet',
                style: TextStyle(
                  fontSize: fontSizeM,
                ),
              ),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Align(
              child: Text(
                'Get Help',
                style: TextStyle(
                  fontSize: fontSizeM,
                ),
              ),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Align(
              child: Text(
                'About',
                style: TextStyle(
                  fontSize: fontSizeM,
                ),
              ),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
