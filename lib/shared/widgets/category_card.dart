import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class CategoryCard extends StatelessWidget {
  final String _image;
  final String _name;
  final int _quantity;

  CategoryCard(this._image, this._name, this._quantity);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            '/productlist',
            arguments: {'category_name': this._name},
          );
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/pictures/${this._image}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                color: blackLevel54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${this._name}',
                      style: TextStyle(
                        fontSize: fontSizeH,
                        color: white,
                      ),
                    ),
                    Text(
                      '${this._quantity}',
                      style: TextStyle(
                        fontSize: fontSizeS,
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
