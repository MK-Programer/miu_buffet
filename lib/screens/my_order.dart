import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/order_history.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('My Orders'),
      ),
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('10/12/2021'),
              ],
            ),
            OrderHistory('tea.jpg', 'Tea', 1, 5.0),
            OrderHistory('dark-roast.jpeg', 'dark-roast', 1, 20.0),
          ],
        ),
      ),
    );
  }
}
