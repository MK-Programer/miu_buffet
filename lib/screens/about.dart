import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/rich_text.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('About Us'),
      ),
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Center(
                child: const Text(
                  'What is MIU Buffett?',
                  style: textStyle2,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                'MIU Buffett is a system that facilitates the process of ordering a drink or snacks from the buffet. Most of the professors face a problem that they should leave their rooms and go for finding the officers in the buffet to order and if they are not there, doctors can not order anything untill they returned back , So the system is going to make this process quick and easy by opening the application and just choosing their order and his room, then the officer will get a notification by the order, information about the doctor and his room. And when he prepaired the order he will deliver it to the doctor in his room without letting the doctor make any effort.',
                textAlign: TextAlign.center,
                style: textStyle3.copyWith(
                  fontSize: fontSize10,
                  fontWeight: fontWeight,
                ),
              ),
              const SizedBox(height: 5.0),
              Center(
                child: const Text(
                  'Core Team',
                  style: textStyle2,
                ),
              ),
              const SizedBox(height: 20.0),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/pictures/amrkhaled.jpeg',
                  ),
                  radius: 50.0,
                ),
              ),
              Center(
                child: const ListTile(
                  title:
                      Text('Amr Khaled Shaltout', textAlign: TextAlign.center),
                  subtitle: Text('Amr1812597@miuegypt.edu.eg',
                      textAlign: TextAlign.center),
                ),
              ),
              const Divider(
                height: 20.0,
                color: black,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/pictures/mostafakhaled.jpg',
                  ),
                  radius: 50.0,
                ),
              ),
              Center(
                child: const ListTile(
                  title: Text('Mostafa Khaled', textAlign: TextAlign.center),
                  subtitle: Text('Mostafa1810751@miuegypt.edu.eg',
                      textAlign: TextAlign.center),
                ),
              ),
              const Divider(
                height: 20.0,
                color: black,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/pictures/sherifelmotayam.jpg',
                  ),
                  radius: 50.0,
                ),
              ),
              Center(
                child: const ListTile(
                  title: Text('Sherif Elmotayam', textAlign: TextAlign.center),
                  subtitle: Text('Sherif1809806@miuegypt.edu.eg',
                      textAlign: TextAlign.center),
                ),
              ),
              const Divider(
                height: 20.0,
                color: black,
              ),
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/pictures/ahmedgamil.jpg',
                  ),
                  radius: 50.0,
                ),
              ),
              Center(
                child: const ListTile(
                  title: Text('Ahmed Gamil', textAlign: TextAlign.center),
                  subtitle: Text('Ahmed1801759@miuegypt.edu.eg',
                      textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
