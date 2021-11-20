import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String _image;
  final String _name;
  final int _quantity;

  CategoryCard(this._image, this._name, this._quantity);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: InkWell(
        onTap: () {
          print('pressed');
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/pictures/${this._image}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 2,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black54,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${this._name}',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '${this._quantity}',
                        style: TextStyle(
                          fontFamily: 'Cairo',
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
