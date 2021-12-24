import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

// ignore: must_be_immutable
class CartCard extends StatefulWidget {
  final String _image;
  final String _name;
  int _quantity;
  final double _price;
  CartCard(this._image, this._name, this._quantity, this._price);

  @override
  _CartCardState createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  void _incrementCounter() {
    setState(() {
      this.widget._quantity++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (this.widget._quantity == 1) return;
      this.widget._quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage('assets/pictures/${this.widget._image}'),
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
                        '${this.widget._name}',
                        style: TextStyle(
                          fontSize: fontSize20,
                          fontWeight: fontWeight,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
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
                  '${this.widget._price} L.E',
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
                        '${this.widget._quantity}',
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
