import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';

class productcard extends StatelessWidget {
  final String _image;
  final String _name;
  final int price;

  productcard(this._image, this._name, this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Colors.white,
      child: InkWell(
        onTap: () {
          print('pressed');
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: [
                  Container(
                    width: 220,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/pictures/${this._image}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${this._name}',
                        style: TextStyle(
                          fontSize: fontSizeH,
                          color: black,
                        ),
                      ),
                      Text(
                        '${this.price}',
                        style: TextStyle(
                          fontSize: fontSizeS,
                          color: black,
                        ),
                      ),
                      ButtonBar(
                        children: [
                          Material(
                            color: Colors.white,
                            child: Center(
                              child: Ink(
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                      Icons.favorite_border_outlined),
                                  color: Colors.black,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.white,
                            child: Center(
                              child: Ink(
                                decoration: ShapeDecoration(
                                  color: red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                child: IconButton(
                                  icon:
                                      const Icon(Icons.shopping_cart_outlined),
                                  color: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                        ],
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
