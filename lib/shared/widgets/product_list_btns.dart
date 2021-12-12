import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class ProductListBtn extends StatelessWidget {
  final String name;
  final String action;
  ProductListBtn({required this.name, required this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text(
            '${this.name}',
          ),
          style: ElevatedButton.styleFrom(
            primary: red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
      ],
    );
  }
}
