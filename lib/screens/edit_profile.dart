import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miu_food_court/models/user.dart';
import 'package:miu_food_court/services/auth.dart';
import 'package:miu_food_court/services/data_service.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/loading.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  AuthService _auth = AuthService();
  String phone = '';
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData?>(
      stream: AuthService().user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          UserData? userData = snapshot.data;
          return Scaffold(
            drawer: SideBar(),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: TopBar('Edit Profile'),
            ),
            bottomNavigationBar: BottomBar(),
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            userData!.picture ?? 'assets/pictures/person.png',
                          ),
                          radius: 70.0,
                        ),
                      ),
                      const Divider(
                        height: 50.0,
                        color: black,
                      ),
                      const Text(
                        'FULL NAME',
                        style: textStyle3,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '${userData.name}',
                        style: textStyle1,
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        'EMAIL',
                        style: textStyle3,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        '${userData.email}',
                        style: textStyle2,
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        'PHONE NUMBER',
                        style: textStyle3,
                      ),
                      const SizedBox(height: 10.0),
                      TextFormField(
                        initialValue: '${userData.phoneNumber}',
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        onChanged: (val) {
                          phone = val;
                        },
                        keyboardType: TextInputType.number,
                        validator: (val) => val!.isEmpty
                            ? 'Enter the phone number please...'
                            : null,
                        decoration: textInputDecoration.copyWith(
                          hintText: 'Enter your number...',
                          suffixIcon: IconButton(
                            onPressed: () async {
                              String result = await _auth.getPref();
                              DatabaseService db = DatabaseService(uid: result);
                              db.savePhone(phone);
                            },
                            icon: Icon(
                              Icons.edit,
                              color: red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else
          return Loading();
      },
    );
  }
}
