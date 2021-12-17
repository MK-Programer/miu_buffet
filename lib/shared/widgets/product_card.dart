import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/product_setting.dart';

class ProductCard extends StatefulWidget {
  final String _image;
  final String _name;
  final double _price;
  final bool _isFav;
  int _quantity;

  ProductCard(
      this._image, this._name, this._price, this._isFav, this._quantity);

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
                      width: 150.0,
                      child: Text(
                        '${this.widget._name}',
                        style: TextStyle(
                          fontSize: fontSizeH,
                          fontWeight: fontWeight,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Favourite(widget._isFav),
                      ],
                    ),
                  ],
                ),
                Text(
                  '${this.widget._price} L.E',
                  style: TextStyle(
                    color: black,
                    fontSize: fontSizeM,
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
                          fontSize: fontSizeS,
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

// ignore: must_be_immutable
class Favourite extends StatefulWidget {
  bool isFavorite;
  Favourite(this.isFavorite);

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
          return ProductSetting();
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
