import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('Settings'),
      ),
      drawer: SideBar(),
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Notifications',
                    style: TextStyle(
                      color: black,
                      fontSize: fontSizeS,
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
                    activeTrackColor: red,
                    activeColor: red,
                  ),
                ],
              ),
              const Divider(
                color: black,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: fontSizeS,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  primary: black,
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
