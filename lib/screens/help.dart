import 'package:flutter/material.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:miu_food_court/shared/widgets/bottom_bar.dart';
import 'package:miu_food_court/shared/widgets/side_menu_bar.dart';
import 'package:miu_food_court/shared/widgets/top_bar.dart';

class FAQs extends StatelessWidget {
  const FAQs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: TopBar('FAQs'),
      ),
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              Center(
                child: const Text(
                  'Got questions? We\'ve got answers.',
                  style: textStyle2,
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                'GENERAL QUESTIONS',
                style: textStyle3.copyWith(
                  fontSize: 18.0,
                ),
              ),
              Text(
                'What is this app for?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: TextStyle(
                    color: black,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'In addition to providing information on our products, we also offer app users many interesting offers. This is an app for our loyal MIU customers.',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'I have no internet connection, I cannot use the app',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: TextStyle(
                    color: black,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'An internet connection is required to ensure you are viewing the most recent information in the app',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'My application won\'t work',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'If this happens, we would recommend',
              ),
              const SizedBox(
                height: 3.0,
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  style: TextStyle(
                    color: black,
                  ),
                  children: [
                    TextSpan(
                      text:
                          '• Restart your phone as a first option\n• If this doesn’t work, you could uninstall your app and reinstall it again\n• Lastly, contact customer services for help',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
