import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/product_setting.dart';

class ProductCard extends StatelessWidget {
  final String _image;
  final String _name;
  final double _price;
  final bool _isFav;

  ProductCard(this._image, this._name, this._price, this._isFav);

  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/pictures/${this._image}',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  child: Text(
                    '${this._name}',
                    style: TextStyle(
                      fontSize: fontSizeM,
                      fontWeight: fontWeight,
                    ),
                  ),
                ),
                Text(
                  '${this._price} \L.E',
                  style: TextStyle(
                    fontSize: fontSizeS,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Favourite(this._isFav),
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: _toggleFavorite,
          child: _iconChecker(),
          style: ElevatedButton.styleFrom(
            primary: grey,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _showSettingsPanel();
            });
          },
          child: Icon(
            Icons.shopping_cart_outlined,
          ),
          style: ElevatedButton.styleFrom(
            primary: red,
          ),
        ),
      ],
    );
  }

  _iconChecker() {
    if (this.widget.isFavorite == true) {
      return Icon(
        Icons.favorite,
        color: red,
      );
    } else
      return Icon(
        Icons.favorite_outlined,
        color: white,
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
