import 'package:flutter/material.dart';
import 'package:miu_food_court/providers/cart_provider.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/cart_card.dart';
import 'package:miu_food_court/shared/widgets/search_bar.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Cart extends StatefulWidget {
  Cart();
  final double deliveryCharge = 5.0;
  late bool check;
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool showHide() {
    if (Provider.of<CartProviders>(context, listen: true).totalCartPrice() ==
        0.0) {
      this.widget.check = false;
    } else {
      this.widget.check = true;
    }
    return this.widget.check;
  }

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
                    return cart.getProduct.length != 0
                        ? ListView.builder(
                            itemCount: cart.getProduct.length,
                            itemBuilder: (context, index) {
                              return CartCard(cart.getProduct[index], index);
                            },
                          )
                        : Center(
                            child: Text(
                              'Empty Cart',
                              style: TextStyle(
                                color: red,
                                fontSize: fontSize18,
                              ),
                            ),
                          );
                  },
                ),
              ),
              Visibility(
                visible: showHide(),
                child: Container(
                  padding: EdgeInsets.all(15.0),
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
                            'Delivery Charge: ${this.widget.deliveryCharge} L.E',
                            style: TextStyle(
                              color: white,
                              fontSize: fontSize18,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Consumer<CartProviders>(
                            builder: (context, CartProviders cart, child) {
                              return Text(
                                'Sub. Total: ${Provider.of<CartProviders>(context, listen: false).totalCartPrice().toString()} L.E',
                                style: TextStyle(
                                  color: white,
                                  fontSize: fontSize18,
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<CartProviders>(
                            builder: (context, CartProviders cart, child) {
                              return Text(
                                'Total: ${(Provider.of<CartProviders>(context, listen: false).totalCartPrice() + this.widget.deliveryCharge).toString()}',
                                style: TextStyle(
                                  color: white,
                                  fontSize: fontSize18,
                                ),
                              );
                            },
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Check out',
                              style: TextStyle(
                                fontSize: fontSize18,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
