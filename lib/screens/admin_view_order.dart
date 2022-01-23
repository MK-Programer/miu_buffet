import 'package:flutter/material.dart';
import 'package:miu_food_court/providers/orders_provider.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/admin_side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/admin_top_bar.dart';
import 'package:miu_food_court/shared/widgets/view_order_admin.dart';
import 'package:provider/provider.dart';

class ViewOrders extends StatefulWidget {
  ViewOrders();

  @override
  _ViewOrdersState createState() => _ViewOrdersState();
}

class _ViewOrdersState extends State<ViewOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminSideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AdminTopBar('Orders'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: Consumer<OrderProviders>(
                  builder: (context, OrderProviders data, child) {
                    return data.getOrders.length != 0
                        ? ListView.builder(
                            itemCount: data.getOrders.length,
                            itemBuilder: (context, index) {
                              return OrdersAdmin(data.getOrders[index], index);
                            },
                          )
                        : Center(
                            child: Text(
                              'No Available Orders',
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
