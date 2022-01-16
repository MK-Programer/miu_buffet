import 'dart:io';
import 'package:flutter/material.dart';
import 'package:miu_food_court/models/product.dart';
import 'package:miu_food_court/providers/product_provider.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/product_setting.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductCard extends StatefulWidget {
  Product data;
  int index;
  int _quantity = 1;
  final bool _isFav = false;

  ProductCard(this.data, this.index);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
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

  Widget build(BuildContext context) {
    dynamic arguments = ModalRoute.of(context)!.settings.arguments as Map;
    if (arguments['category_name'] == widget.data.category) {
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
                        File(widget.data.picture),
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
                          '${this.widget.data.name}',
                          style: TextStyle(
                            fontSize: fontSize20,
                            fontWeight: fontWeight,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Favourite(widget._isFav, widget.index, widget.data,
                              widget._quantity),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '${this.widget.data.price} L.E',
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
    } else
      return Text('asd');
  }
}

// ignore: must_be_immutable
class Favourite extends StatefulWidget {
  bool isFavorite;
  Product data;
  int quantity;
  int index;
  Favourite(this.isFavorite, this.index, this.data, this.quantity);

  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return ProductSetting(widget.data, widget.index, widget.quantity);
        },
      );
    }

    return Column(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _showSettingsPanel();
            });
          },
          icon: Icon(
            Icons.shopping_cart_outlined,
            color: red,
          ),
        ),
        IconButton(
          onPressed: _toggleFavorite,
          icon: _iconChecker(),
        ),
      ],
    );
  }

  _iconChecker() {
    if (this.widget.isFavorite == false) {
      return Icon(
        Icons.favorite_outline,
        color: red,
      );
    } else
      return Icon(
        Icons.favorite_outlined,
        color: red,
      );
  }

  _toggleFavorite() {
    setState(
      () {
        if (!this.widget.isFavorite) {
          this.widget.isFavorite = true;
        } else {
          this.widget.isFavorite = false;
        }
      },
    );
  }
}
