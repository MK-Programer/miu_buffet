import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/product_card.dart';
import 'package:miu_food_court/shared/widgets/search_bar.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

class Fav extends StatelessWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('Favourite'),
      ),
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              SearchBar(),
              const SizedBox(
                height: 10.0,
              ),
              ProductCard('latte.jpg', 'Latte', 10.0, true, 1),
              ProductCard('tea.jpg', 'Tea', 5.0, true, 1),
              ProductCard(
                  'cappuccino-milk.jpeg', 'Cappuccino Milk', 10.0, true, 1),
              ProductCard('coffee.jpeg', 'Coffee', 15.0, true, 1),
              /*
              ProductCard('dark-roast.jpeg', 'Dark Roast', 20.0, true),
              ProductCard('espresso.jpeg', 'Espresso', 10.0, true),
              */
            ],
          ),
        ),
      ),
    );
  }
}
