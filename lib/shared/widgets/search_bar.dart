import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: textInputDecoration.copyWith(
        hintText: 'Search for an item...',
        prefixIcon: Icon(
          Icons.search,
          color: grey,
        ),
      ),
    );
  }
}
