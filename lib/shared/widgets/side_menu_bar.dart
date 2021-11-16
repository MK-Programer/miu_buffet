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
            leading: Icon(Icons.home),
            title: Align(
              child: Text('Home'),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Align(
              child: Text('My Account'),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Align(
              child: Text('Your orders'),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.wallet_membership),
            title: Align(
              child: Text('Wallet'),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help_outline),
            title: Align(
              child: Text('Get Help'),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Align(
              child: Text('About'),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Align(
              child: Text('Settings'),
              alignment: Alignment(-1.2, 0),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/setting');
            },
          ),
        ],
      ),
    );
  }
}
