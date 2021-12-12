import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: SideBar(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: TopBar('Check Out'),
        ),
        bottomNavigationBar: BottomBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Payment Method',
                      style: textStyle2,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Change',
                        style: TextStyle(
                          fontSize: fontSizeS,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Delivery Method',
                        style: textStyle2,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change',
                          style: TextStyle(
                            fontSize: fontSizeS,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    children: [
                      Icon(
                        Icons.home,
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Delivery Options',
                        style: textStyle2,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Change',
                          style: TextStyle(
                            fontSize: fontSizeS,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 2.0),
                  Row(
                    children: [
                      Icon(
                        Icons.nordic_walking_sharp,
                        color: red,
                      ),
                      Text(
                        'I’ll pick it up myself',
                        style: TextStyle(
                          fontSize: fontSizeS,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.pedal_bike,
                        color: red,
                      ),
                      Text(
                        'By courier',
                        style: TextStyle(
                          fontSize: fontSizeS,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
            ]),
          ),
        ));
  }
}
