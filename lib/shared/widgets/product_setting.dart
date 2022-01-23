import 'package:flutter/material.dart';
import 'package:miu_food_court/models/product.dart';
import 'package:miu_food_court/providers/cart_provider.dart';
import 'package:miu_food_court/services/auth.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductSetting extends StatefulWidget {
  Product data;
  int index;
  int quantity;

  ProductSetting(this.data, this.index, this.quantity);

  @override
  _ProductSettingState createState() => _ProductSettingState();
}

class _ProductSettingState extends State<ProductSetting> {
  late String _sugarCount = '0';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
      child: ListView(
        children: [
          Center(
            child: Text(
              widget.data.name + ' Beverages',
              style: TextStyle(
                fontSize: fontSize20,
                color: red,
                fontWeight: fontWeight,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            // inputFormatters: [
            //   FilteringTextInputFormatter.digitsOnly,
            // ],
            // keyboardType: TextInputType.number,
            validator: (val) =>
                val!.isEmpty ? 'Enter the count of sugar(s)' : null,
            onChanged: (val) {
              _sugarCount = val;
            },
            //initialValue: '01020820065',
            decoration: textInputDecoration.copyWith(
              hintText: '0 Sugar(s)',
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            child: Text(
              'Add',
              style: TextStyle(
                color: white,
                fontSize: fontSize18,
              ),
            ),
            onPressed: () async {
              AuthService _auth = AuthService();
              String result = await _auth.getPref();
              // print(widget.data.picture);
              Provider.of<CartProviders>(context, listen: false).addProducts(
                result,
                widget.data.pid,
                widget.data.picture,
                widget.data.name,
                _sugarCount,
                widget.quantity,
                widget.data.price,
                widget.data.price * widget.quantity,
                widget.data.category,
              );
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: red,
              minimumSize: Size.fromHeight(40),
            ),
          ),
        ],
      ),
    );
  }
}
