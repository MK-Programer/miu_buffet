import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/admin_side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

bool Admin_Visibilty=true;
class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:  Admin_Visibilty?AdminSideBar():SideBar() ,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('Edit Profile'),
      ),
      bottomNavigationBar: Admin_Visibilty? null:BottomBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                      'assets/pictures/person.png',
                    ),
                    radius: 70.0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                      ),
                      onPressed: () {},
                    ),
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
                const Text(
                  'Essam Eliwa',
                  style: textStyle1,
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'EMAIL',
                  style: textStyle3,
                ),
                const SizedBox(height: 10.0),
                const Text(
                  'essam.eliwa@miuegypt.edu.eg',
                  style: textStyle2,
                ),
                const SizedBox(height: 30.0),
                const Text(
                  'PHONE NUMBER',
                  style: textStyle3,
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  keyboardType: TextInputType.number,
                  validator: (val) =>
                      val!.isEmpty ? 'Enter the phone number please...' : null,
                  onChanged: (val) {},
                  initialValue: '01020820065',
                  decoration: textInputDecoration.copyWith(
                    hintText: 'Enter your number...',
                    suffixIcon: IconButton(
                      onPressed: () {},
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
  }
}
