import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miu_food_court/models/order.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

// ignore: must_be_immutable
class OrderHistory extends StatefulWidget {
  Order order;
  int index;
  OrderHistory(this.order, this.index);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Card(
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(
                        File(widget.order.picture),
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 25.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Name: ',
                          style: TextStyle(
                            fontSize: fontSize18,
                            fontWeight: fontWeight,
                          ),
                        ),
                        Text(
                          '${this.widget.order.name}',
                          style: TextStyle(
                            fontSize: fontSize18,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Quantity: ',
                          style: TextStyle(
                            fontSize: fontSize15,
                            fontWeight: fontWeight,
                          ),
                        ),
                        Text(
                          '${this.widget.order.quantity}',
                          style: TextStyle(
                            fontSize: fontSize15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Price: ',
                          style: TextStyle(
                            fontSize: fontSize15,
                            fontWeight: fontWeight,
                          ),
                        ),
                        Text(
                          '${this.widget.order.totalPrice} L.E',
                          style: TextStyle(
                            fontSize: fontSize15,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
