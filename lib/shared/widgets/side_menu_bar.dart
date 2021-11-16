import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFF6F5F5),
            ),
            child: Padding(
              padding: EdgeInsets.zero,
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
          ),
        ],
      ),
    );
  }
}
