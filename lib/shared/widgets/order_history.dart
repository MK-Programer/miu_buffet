import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class OrderHistory extends StatelessWidget {
  final String _productPicture;
  final String _productName;
  final int _quantity;
  final double _price;
  const OrderHistory(
      this._productPicture, this._productName, this._quantity, this._price);

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
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/pictures/${this._productPicture}',
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
                            fontSize: fontSizeM,
                            fontWeight: fontWeight,
                          ),
                        ),
                        Text(
                          '${this._productName}',
                          style: TextStyle(
                            fontSize: fontSizeM,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Quantity: ',
                          style: TextStyle(
                            fontSize: fontSizeS,
                            fontWeight: fontWeight,
                          ),
                        ),
                        Text(
                          '${this._quantity}',
                          style: TextStyle(
                            fontSize: fontSizeS,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          'Price: ',
                          style: TextStyle(
                            fontSize: fontSizeS,
                            fontWeight: fontWeight,
                          ),
                        ),
                        Text(
                          '${this._price} L.E',
                          style: TextStyle(
                            fontSize: fontSizeS,
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
