import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/product_card.dart';
import 'package:miu_food_court/shared/widgets/product_list_btns.dart';
import 'package:miu_food_court/shared/widgets/search_bar.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

// ignore: must_be_immutable
class ProductList extends StatelessWidget {
  dynamic arguments;
  ProductList();

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as Map;

    //if (arguments != null) print(arguments['category_name']);
    return Scaffold(
      drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('${arguments['category_name']}'),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ProductListBtn(name: 'All', action: 'All'),
                    ProductListBtn(name: 'Coffee', action: 'Coffee'),
                    ProductListBtn(name: 'Tea', action: 'Tea'),
                    ProductListBtn(name: 'Espresso', action: 'Espresso'),
                    ProductListBtn(name: 'Latte', action: 'Latte'),
                    ProductListBtn(name: 'Dark Roast', action: 'Dark Roast'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              ProductCard('latte.jpg', 'Latte', 10.0, false),
              ProductCard('tea.jpg', 'Tea', 5.0, false),
              ProductCard(
                  'cappuccino-milk.jpeg', 'Cappuccino Milk', 10.0, false),
              ProductCard('coffee.jpeg', 'Coffee', 15.0, false),
              ProductCard('dark-roast.jpeg', 'Dark Roast', 20.0, false),
              ProductCard('espresso.jpeg', 'Espresso', 10.0, false),
            ],
          ),
        ),
      ),
    );
  }
}
