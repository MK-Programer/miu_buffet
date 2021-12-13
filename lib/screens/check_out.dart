import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final List<String> options = ['By Myself', 'By delivery'];
  String _deliveryOption = 'By Myself';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('Check out'),
      ),
      //  bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery Method',
                        style: textStyle3.copyWith(
                          fontSize: fontSizeM,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change',
                          style: TextStyle(
                            fontSize: fontSizeS,
                            color: red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    children: const [
                      Icon(
                        Icons.home_outlined,
                        size: iconSize,
                        color: red,
                      ),
                      Text(
                        'Room 307',
                        style: TextStyle(
                          fontSize: fontSizeS,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delivery Options',
                    style: textStyle3.copyWith(
                      fontSize: fontSizeM,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  DropdownButtonFormField<String>(
                    value: _deliveryOption,
                    decoration: textInputDecoration,
                    items: options.map(
                      (e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text('$e'),
                        );
                      },
                    ).toList(),
                    // if the onChanged callback is null or the list of items is null
                    // then the dropdown button will be disabled
                    onChanged: (val) =>
                        setState(() => _deliveryOption = val as String),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
