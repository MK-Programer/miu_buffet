import 'package:flutter/material.dart';
import 'package:miu_food_court/models/order.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

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
        elevation: 5.0,
        margin: EdgeInsets.fromLTRB(5.0, 6.0, 5.0, 0.0),
        child: ListTile(
          title: Text(
            '${this.data.uid}',
            style: TextStyle(
              fontSize: fontSize18,
              color: red,
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                'Product: ${this.data.name}',
                style: TextStyle(
                  fontSize: fontSize15,
                  color: black,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Text(
                '/ Room: 324',
                style: TextStyle(
                  fontSize: fontSize15,
                  color: black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
