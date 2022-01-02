import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/admin_side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/admin_top_bar.dart';

class AdminSearch extends StatelessWidget {
  const AdminSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminSideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AdminTopBar('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: TextField(
          decoration: textInputDecoration.copyWith(
            hintText: 'Search for an item...',
            prefixIcon: Icon(
              Icons.search,
              color: grey,
            ),
          ),
        ),
      ),
    );
  }
}
