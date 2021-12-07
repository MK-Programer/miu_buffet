import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/card.dart';
import 'package:miu_food_court/shared/widgets/productcard.dart';
import 'package:miu_food_court/shared/widgets/search_bar.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

class products extends StatelessWidget {
  const products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double cardWidth = MediaQuery.of(context).size.width;
    double cardHeight = MediaQuery.of(context).size.height / 5.5;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('Cateogry name'),
      ),
      bottomNavigationBar: BottomBar(),
      extendBodyBehindAppBar:
          true, // to make the background image or color extended to the appbar
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SearchBar(),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 1,
                  childAspectRatio: cardWidth / cardHeight,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 5,
                  children: [
                    productcard('hot-drinks.jpg', "Coffee", 20),
                    productcard('tea.jpg', "tea", 40),
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
