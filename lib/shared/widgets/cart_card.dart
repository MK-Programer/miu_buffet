import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

// ignore: must_be_immutable
class CartCard extends StatefulWidget {
  final String _productPicture;
  final String _productName;
  int _quantity;
  final double _price;
  CartCard(
      this._productPicture, this._productName, this._quantity, this._price);

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
    return Container(
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Card(
        child: Row(
          children: [
            Container(
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/pictures/${this.widget._productPicture}',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${this.widget._productName}',
                            style: TextStyle(
                              fontSize: fontSizeM,
                              fontWeight: fontWeight,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: red,
                              size: iconSize,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: _decrementCounter,
                        icon: Icon(
                          Icons.remove,
                          color: grey,
                          size: iconSize,
                        ),
                      ),
                      Text(
                        '${this.widget._quantity}',
                        style: TextStyle(
                          fontSize: fontSizeS,
                          fontWeight: fontWeight,
                        ),
                      ),
                      IconButton(
                        onPressed: _incrementCounter,
                        icon: Icon(
                          Icons.add,
                          color: Colors.black,
                          size: iconSize,
                        ),
                      ),
                      Text(
                        '${this.widget._price} L.E',
                        style: TextStyle(
                          fontSize: fontSizeS,
                          fontWeight: fontWeight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
