import 'package:flutter/material.dart';
import 'package:miu_food_court/screens/sign_in.dart';
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
    //final Color activeColor = Color(0xFFA83332);
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
                      color: Colors.black,
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
                    activeTrackColor: Color(0xFFA83332),
                    activeColor: Color(0xFFA83332),
                  ),
                ],
              ),
              const Divider(
                color: Colors.black,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: fontSizeS,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size.fromHeight(40),
                  primary: Colors.black,
                  alignment: Alignment.centerLeft,
                ),
              ),
              const Divider(
                color: Colors.black,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Signup',
                  style: TextStyle(
                    fontSize: fontSizeS,
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
