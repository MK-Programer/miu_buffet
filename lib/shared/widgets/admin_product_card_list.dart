import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miu_food_court/models/product.dart';
import 'package:miu_food_court/providers/product_provider.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CardList extends StatelessWidget {
  Product data;
  int index;

  CardList(this.data, this.index);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/pictures/latte.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${data.name}',
                      style: TextStyle(
                        fontWeight: fontWeight,
                        fontSize: fontSize20,
                        color: black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.edit_outlined,
                        color: red,
                      ),
                      onPressed: () {
                        data.name = Provider.of<ProductProviders>(context,
                                listen: false)
                            .productName(index);
                        data.price = Provider.of<ProductProviders>(context,
                                listen: false)
                            .productPrice(index);
                        showAlertDialog(context);
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${data.price}',
                      style: TextStyle(
                        fontSize: fontSize15,
                        color: black,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete_outlined,
                        color: red,
                      ),
                      onPressed: () {
                        Provider.of<ProductProviders>(context, listen: false)
                            .removeProducts(index);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    // Create button
    Widget okButton = TextButton(
      child: Text(
        'Edit',
        style: TextStyle(
          color: red,
        ),
      ),
      onPressed: () {
        if (_formkey.currentState!.validate()) {
          Provider.of<ProductProviders>(context, listen: false)
              .editProducts(index, data.name, data.price);
          Navigator.of(context).pop();
        }
      },
    );
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      backgroundColor: transparentWhite,
      title: Text("Edit A Product"),
      content: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: '${data.name}',
              decoration: textInputDecoration.copyWith(
                hintText: 'Name',
              ),
              validator: (val) =>
                  val!.isEmpty ? 'Enter the product name' : null,
              onChanged: (val) {
                data.name = val;
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.number,
              initialValue: '${data.price}',
              decoration: textInputDecoration.copyWith(
                hintText: 'Price',
              ),
              validator: (val) =>
                  val!.isEmpty ? 'Enter the product price' : null,
              onChanged: (val) {
                data.price = val;
              },
            ),
          ],
        ),
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
