import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class RichTextUpdated extends StatelessWidget {
  final String text;
  RichTextUpdated({required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        style: TextStyle(
          color: black,
        ),
        children: [
          TextSpan(
            text: this.text,
          ),
        ],
      ),
    );
  }
}
