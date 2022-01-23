import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:miu_food_court/models/product.dart';
import 'package:miu_food_court/services/auth.dart';
import 'package:miu_food_court/services/data_service.dart';

AuthService auth = AuthService();
DatabaseService db = DatabaseService(uid: auth.getPref());

class ProductProviders extends ChangeNotifier {
  final CollectionReference hotDrinksCollection =
      FirebaseFirestore.instance.collection('Hot Drinks');

  final CollectionReference softDrinksCollection =
      FirebaseFirestore.instance.collection('Soft Drinks');

  final CollectionReference snacksCollection =
      FirebaseFirestore.instance.collection('Snacks');

  List<Product> products = <Product>[];
  List<Product> get getProduct {
    return products;
  }

  void addProducts(String picture, String name, String price, String category) {
    Product product = new Product(picture, name, price, category);
    products.add(product);
    notifyListeners();
  }

  // Future<void> readProduct() async {
  //   QuerySnapshot querySnapshot1 = await hotDrinksCollection.get();
  //   QuerySnapshot querySnapshot2 = await softDrinksCollection.get();
  //   QuerySnapshot querySnapshot3 = await snacksCollection.get();
  //   // Get data from docs and convert map to List
  //   // final data1 = querySnapshot1.docs.map((doc) => doc.data()).toList();
  //   // final data2 = querySnapshot1.docs.map((doc) => doc.data()).toList();
  //   // final data3 = querySnapshot1.docs.map((doc) => doc.data()).toList();
  //   final allData =
  //       List.from(querySnapshot1.docs.map((doc) => doc.data()).toList());
  //   for (var element in allData) {
  //     print(element);
  //     products.add(element);
  //     notifyListeners();
  //   }
  // }

  Future<void> saveProduct() async {
    for (int i = 0; i < products.length; i++) {
      await FirebaseFirestore.instance
          .collection('${products[i].category}')
          .doc()
          .set(
        {
          'picture': products[i].picture,
          'name': products[i].name,
          'price': products[i].price,
        },
      );
    }
  }

  void removeProducts(int index) {
    products.removeAt(index);
    notifyListeners();
  }

  int getCatProductCount(String category) {
    int cnt = 0;
    for (int i = 0; i < products.length; i++) {
      if (products[i].category == category) cnt++;
    }
    return cnt;
  }

  void editProducts(
      int index, String picture, String name, String price, String category) {
    products[index].name = name;
    products[index].price = price;
    products[index].picture = picture;
    products[index].category = category;
    notifyListeners();
  }

  String productPicture(int index) {
    return products[index].picture;
  }

  String productName(int index) {
    return products[index].name;
  }

  String productPrice(int index) {
    return products[index].price;
  }
}
