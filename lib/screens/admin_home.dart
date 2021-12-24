import 'package:flutter/material.dart';
import 'package:miu_food_court/providers/product_provider.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/admin_product_card_list.dart';
import 'package:miu_food_court/shared/widgets/admin_side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/admin_top_bar.dart';
import 'package:provider/provider.dart';

class AdminHome extends StatefulWidget {
  AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AdminSideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AdminTopBar('Products'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ProductProviders>(
          builder: (context, ProductProviders data, child) {
            return data.getProduct.length != 0
                ? ListView.builder(
                    itemCount: data.getProduct.length,
                    itemBuilder: (context, index) {
                      return CardList(data.getProduct[index], index);
                    },
                  )
                : Center(
                    child: Text(
                      'No Products',
                      style: TextStyle(
                        color: red,
                        fontSize: fontSize15,
                      ),
                    ),
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        backgroundColor: white,
        child: Icon(
          Icons.add,
          color: red,
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    TextEditingController _name = TextEditingController();
    TextEditingController _price = TextEditingController();
    // Create button
    Widget okButton = TextButton(
      child: Text(
        'Add',
        style: TextStyle(
          color: red,
        ),
      ),
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          Provider.of<ProductProviders>(context, listen: false)
              .addProducts(_name.text, _price.text);
          Navigator.of(context).pop();
        }
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: transparentWhite,
      title: Text(
        'Add a product',
        style: TextStyle(
          color: black,
          fontSize: fontSize18,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Form(
            key: _formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: _name,
                  decoration: textInputDecoration.copyWith(
                    hintText: 'Name',
                  ),
                  validator: (val) =>
                      val!.isEmpty ? 'Enter the product name' : null,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: _price,
                  decoration: textInputDecoration.copyWith(
                    hintText: 'Price',
                  ),
                  validator: (val) =>
                      val!.isEmpty ? 'Enter the product price' : null,
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
