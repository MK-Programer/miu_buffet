import 'package:flutter/material.dart';
import 'package:miu_food_court/providers/product_provider.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/product_card.dart';
import 'package:miu_food_court/shared/widgets/search_bar.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';
import 'package:provider/provider.dart';

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
          child: Column(
            children: [
              SearchBar(),
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Consumer<ProductProviders>(
                  builder: (context, ProductProviders data, child) {
                    return data.getProduct.length != 0
                        ? ListView.builder(
                            itemCount: data.getProduct.length,
                            itemBuilder: (context, index) {
                              return ProductCard(data.getProduct[index], index);
                            },
                          )
                        : Center(
                            child: Text(
                              'No Available Products',
                              style: TextStyle(
                                color: red,
                                fontSize: fontSize15,
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
