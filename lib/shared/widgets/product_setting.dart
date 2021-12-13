import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:miu_food_court/shared/variables/constants.dart';

class ProductSetting extends StatefulWidget {
  ProductSetting({Key? key}) : super(key: key);

  @override
  _ProductSettingState createState() => _ProductSettingState();
}

class _ProductSettingState extends State<ProductSetting> {
  int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
      child: ListView(
        children: [
          const Text(
            'Drink Beverages',
            style: TextStyle(
              fontSize: fontSizeH,
              color: red,
              fontWeight: fontWeight,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            validator: (val) =>
                val!.isEmpty ? 'Enter the count of items' : null,
            onChanged: (val) {},
            //initialValue: '01020820065',
            decoration: textInputDecoration.copyWith(
              hintText: 'Count of items',
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          TextFormField(
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            keyboardType: TextInputType.number,
            validator: (val) =>
                val!.isEmpty ? 'Enter the count of sugar(s)' : null,
            onChanged: (val) {},
            //initialValue: '01020820065',
            decoration: textInputDecoration.copyWith(
              hintText: '0 Sugar(s)',
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Text(
                'Strength',
                style: TextStyle(
                  fontSize: fontSizeM,
                ),
              ),
            ],
          ),
          Slider(
            value: (_currentStrength).toDouble(), // initial value
            min: 100.0,
            max: 900.0,
            divisions: 8,
            onChanged: (val) => setState(() => _currentStrength = val.round()),
            activeColor: Colors.brown[_currentStrength],
            inactiveColor: Colors.brown[_currentStrength],
          ),
          ElevatedButton(
            child: Text(
              'Update',
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSizeM,
              ),
            ),
            onPressed: () {
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
