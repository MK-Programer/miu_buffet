import 'package:flutter/material.dart';
import 'package:miu_food_court/providers/cart_provider.dart';
import 'package:miu_food_court/providers/orders_provider.dart';
import 'package:miu_food_court/providers/product_provider.dart';
import 'package:miu_food_court/screens/about.dart';
import 'package:miu_food_court/screens/admin_add_product.dart';
import 'package:miu_food_court/screens/admin_home.dart';
import 'package:miu_food_court/screens/admin_search.dart';
import 'package:miu_food_court/screens/admin_view_order.dart';
import 'package:miu_food_court/screens/cart.dart';
import 'package:miu_food_court/screens/check_out.dart';
import 'package:miu_food_court/screens/edit_profile.dart';
import 'package:miu_food_court/screens/favourite.dart';
import 'package:miu_food_court/screens/help.dart';
import 'package:miu_food_court/screens/home.dart';
import 'package:miu_food_court/screens/my_order.dart';
import 'package:miu_food_court/screens/product_list.dart';
import 'package:miu_food_court/screens/setting.dart';
import 'package:miu_food_court/screens/sign_in.dart';
import 'package:miu_food_court/screens/view_offices.dart';
import 'package:miu_food_court/shared/variables/constants.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrderProviders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MIU Buffet',
        // add background color and font-family to whole my app
        theme: ThemeData(
          scaffoldBackgroundColor: transparentWhite,
          fontFamily: fontFamily,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SignIn(),
          '/setting': (context) => Setting(),
          '/home': (context) => Home(),
          '/editprofile': (context) => EditProfile(),
          '/productlist': (context) => ProductList(),
          '/faqs': (context) => FAQs(),
          '/cart': (context) => Cart(),
          '/order': (context) => MyOrder(),
          '/fav': (context) => Fav(),
          '/checkout': (context) => Checkout(),
          '/adminhome': (context) => AdminHome(),
          '/adminaddproduct': (context) => AdminAddProduct(),
          '/adminsearch': (context) => AdminSearch(),
          '/viewofficers': (context) => ViewOffices(),
          // '/addoffice': (context) => AddOffice(),
          '/about': (context) => Aboutus(),
          '/vieworders': (context) => ViewOrders(),
        },
      ),
    );
  }
}
