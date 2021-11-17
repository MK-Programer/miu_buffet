import 'package:flutter/material.dart';

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
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.receipt),
            title: Align(
              child: Text('My orders'),
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
        ],
      ),
    );
  }
}
