import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.account_box_outlined,
                  size: 50,
                ),
                const Text(
                  'Hi Guest',
                ),
              ],
            ),
          ),
          ListTile(
            leading: new Icon(Icons.home),
            title: Align(
              child: new Text('Home'),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: new Icon(Icons.receipt),
            title: Align(
              child: new Text('Your orders'),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: new Icon(Icons.wallet_membership),
            title: Align(
              child: new Text('Wallet'),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: new Icon(Icons.help_outline),
            title: Align(
              child: new Text('Get Help'),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: new Icon(Icons.info_outline),
            title: Align(
              child: new Text('About'),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
