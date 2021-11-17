import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/widgets/card.dart';
import 'package:miu_food_court/shared/widgets/search_bar.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar(''),
      ),
      extendBodyBehindAppBar:
          true, // to make the background image or color extended to the appbar
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF6F5F5),
        ),
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(
                        fontFamily: 'Cairo',
                        fontSize: 30.0,
                        color: Color(0xFFA83332),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: SearchBar(),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: .85,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: [
                          CategoryCard('hot-drinks.jpg', 'Coffee', 45),
                          CategoryCard('cold-drinks.png', 'Soft Drinks', 40),
                          CategoryCard('snacks.jpeg', 'Snacks', 35),
                          CategoryCard('tee.jpg', 'Tee', 30),
                          //CategoryCard('hot-drinks.jpg', 'Hot Drinks', 25),
                          //CategoryCard('hot-drinks.jpg', 'Hot Drinks', 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
