import 'package:flutter/material.dart';
import 'package:miu_food_court/providers/product_provider.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/admin_product_card_list.dart';
import 'package:miu_food_court/shared/widgets/admin_side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/admin_top_bar.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatefulWidget {
  AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminSideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AdminTopBar('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProductProviders>(
          builder: (context, ProductProviders data, child) {
            return data.getProduct.length != 0
                ? ListView.builder(
                    itemCount: data.getProduct.length,
                    itemBuilder: (context, index) {
                      return CardList(data.getProduct[index], index);
                    },
                  )
                : Center(
                    child: Text(
                      'No Products',
                      style: TextStyle(
                        color: red,
                        fontSize: fontSize15,
                      ),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
