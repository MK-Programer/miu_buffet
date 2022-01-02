import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miu_food_court/models/cart.dart';
import 'package:miu_food_court/providers/cart_provider.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CartCard extends StatefulWidget {
  Cart cart;
  int index;
  CartCard(this.cart, this.index);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  void _incrementCounter() {
    setState(() {
      this.widget.cart.quantity++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (this.widget.cart.quantity == 1) return;
      this.widget.cart.quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
            child: ListView(
              children: [
                Center(
                  child: const Text(
                    'Drink Beverages',
                    style: TextStyle(
                      fontSize: fontSize20,
                      color: red,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  initialValue: widget.cart.sugar,
                  validator: (val) =>
                      val!.isEmpty ? 'Enter the count of sugar(s)' : null,
                  onChanged: (val) {
                    widget.cart.sugar = val;
                  },
                  //initialValue: '01020820065',
                  decoration: textInputDecoration.copyWith(
                    hintText: '0 Sugar(s)',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      'Strength',
                      style: TextStyle(
                        fontSize: fontSize18,
                      ),
                    ),
                  ],
                ),
                Slider(
                  value: (widget.cart.strength).toDouble(), // initial value
                  min: 100.0,
                  max: 900.0,
                  divisions: 8,
                  onChanged: (val) =>
                      setState(() => widget.cart.strength = val.round()),
                  activeColor: Colors.brown[widget.cart.strength],
                  inactiveColor: Colors.brown[widget.cart.strength],
                ),
                ElevatedButton(
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: white,
                      fontSize: fontSize18,
                    ),
                  ),
                  onPressed: () {
                    Provider.of<CartProviders>(context, listen: false)
                        .editProducts(
                      widget.index,
                      widget.cart.quantity,
                      widget.cart.price,
                      widget.cart.sugar,
                      widget.cart.strength,
                    );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: red,
                    minimumSize: Size.fromHeight(40),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    return Card(
      elevation: 5.0,
      color: white,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 3,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(
                      File(widget.cart.picture),
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 100.0,
                      child: Text(
                        '${this.widget.cart.name}',
                        style: TextStyle(
                          fontSize: fontSize20,
                          fontWeight: fontWeight,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            widget.cart.sugar = Provider.of<CartProviders>(
                                    context,
                                    listen: false)
                                .sugarCount(widget.index);
                            _showSettingsPanel();
                          },
                          icon: Icon(
                            Icons.edit_outlined,
                            color: red,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Provider.of<CartProviders>(context, listen: false)
                                .removeProducts(widget.index);
                          },
                          icon: Icon(
                            Icons.delete_outlined,
                            color: red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  '${this.widget.cart.price} L.E',
                  style: TextStyle(
                    color: black,
                    fontSize: fontSize18,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          _decrementCounter();
                        },
                        icon: Icon(
                          Icons.remove,
                          color: red,
                          size: iconSize,
                        ),
                      ),
                      Text(
                        '${this.widget.cart.quantity}',
                        style: TextStyle(
                          fontSize: fontSize15,
                          fontWeight: fontWeight,
                          color: red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _incrementCounter();
                        },
                        icon: Icon(
                          Icons.add,
                          color: red,
                          size: iconSize,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
