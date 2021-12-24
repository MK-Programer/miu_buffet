import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/category_card.dart';
import 'package:miu_food_court/shared/widgets/search_bar.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width;
    double cardHeight = MediaQuery.of(context).size.height / 1.5;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('Delivering to Room : 307'),
      ),
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: fontSize30,
                  color: red,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                child: SearchBar(),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: cardWidth / cardHeight,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    CategoryCard('hot-drinks.jpg', 'Hot Drinks', 45),
                    CategoryCard('soft-drinks.jpg', 'Soft Drinks', 40),
                    CategoryCard('snacks.jpg', 'Snacks', 35),
                    //CategoryCard('tea.jpg', 'Tea', 30),
                    //CategoryCard('hot-drinks.jpg', 'Hot Drinks', 25),
                    //CategoryCard('hot-drinks.jpg', 'Hot Drinks', 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
