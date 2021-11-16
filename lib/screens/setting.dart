import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    //final Color activeColor = Color(0xFFA83332);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('Settings'),
      ),
      drawer: SideBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      activeTrackColor: Color(0xFFA83332),
                      activeColor: Color(0xFFA83332),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Cairo',
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  primary: Colors.black,
                  alignment: Alignment.centerLeft,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}