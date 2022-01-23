import 'package:flutter/material.dart';
import 'package:miu_food_court/models/order.dart';

// ignore: must_be_immutable
class OrdersAdmin extends StatelessWidget {
  Order data;
  int index;
  OrdersAdmin(this.data, this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          title: Text('${this.data.uid}'),
          subtitle: Text('${this.data.name}'),
        ),
      ),
    );
  }
}
