import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/order_history.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';
import 'package:miu_food_court/providers/cart_provider.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/search_bar.dart';
import 'package:provider/provider.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('Orders'),
      ),
      bottomNavigationBar: BottomBar(),
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
                child: Consumer<CartProviders>(
                  builder: (context, CartProviders cart, child) {
                    return cart.getOrders.length != 0
                        ? ListView.builder(
                            itemCount: cart.getOrders.length,
                            itemBuilder: (context, index) {
                              return OrderHistory(cart.getOrders[index], index);
                            },
                          )
                        : Center(
                            child: Text(
                              'Empty Orders',
                              style: TextStyle(
                                color: red,
                                fontSize: fontSize18,
                              ),
                            ),
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
