import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/cart_card.dart';
import 'package:miu_food_court/shared/widgets/search_bar.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

class Cart extends StatelessWidget {
  const Cart();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('Cart'),
      ),
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SearchBar(),
            ),
            CartCard('latte.jpg', 'Latte', 10, 10.0),
            CartCard('tea.jpg', 'Tea', 5, 5.0),
            CartCard('cappuccino-milk.jpeg', 'Capp.', 15, 10.0),
            CartCard('coffee.jpeg', 'Coffee', 15, 10.0),
            CartCard('dark-roast.jpeg', 'Dark Roast', 20, 20.0),
            CartCard('espresso.jpeg', 'Espresso', 10, 10.0),
            Container(
              padding: const EdgeInsets.all(15.0),
              height: 150,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: red,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Delivery Charge: 5.0 L.E',
                        style: TextStyle(
                          color: white,
                          fontSize: fontSizeM,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'Sub Total: 10.0 L.E',
                        style: TextStyle(
                          color: white,
                          fontSize: fontSizeM,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: 15.0 L.E',
                        style: TextStyle(
                          color: white,
                          fontSize: fontSizeM,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/checkout');
                        },
                        child: Text(
                          'Check out',
                          style: TextStyle(
                            fontSize: fontSizeM,
                            color: black,
                            fontWeight: fontWeight,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(primary: white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
