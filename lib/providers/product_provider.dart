import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/foundation.dart';
import 'package:miu_food_court/models/product.dart';

class ProductProviders extends ChangeNotifier {
  int pid = 0;
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

  load() async {
    QuerySnapshot querySnapshot1 = await hotDrinksCollection.get();
    QuerySnapshot querySnapshot2 = await softDrinksCollection.get();
    QuerySnapshot querySnapshot3 = await snacksCollection.get();
    var result1 =
        querySnapshot1.docs.map((doc) => {'data': doc.data(), 'id': doc.id});

    var result2 =
        querySnapshot2.docs.map((doc) => {'data': doc.data(), 'id': doc.id});

    var result3 =
        querySnapshot3.docs.map((doc) => {'data': doc.data(), 'id': doc.id});

    // combine the result of the 3 results in allData
    var allData = []..addAll(result1)..addAll(result2)..addAll(result3);

    for (var element in allData) {
      Product product = new Product.fromJson(element);
      products.add(product);
      notifyListeners();
    }
  }

  Future<void> addProducts(
      String picture, String name, String price, String category) async {
    Product product = new Product(pid, picture, name, price, category);
    products.add(product);

    await FirebaseFirestore.instance
        .collection('${product.category}')
        .doc(this.pid.toString())
        .set(
      {
        'pid': this.pid.toString(),
        'picture': product.picture,
        'name': product.name,
        'price': product.price,
        'category': product.category,
      },
    );
    // print('pid1 $pid');
    this.pid++;
    notifyListeners();
  }

  destructList() {
    products.clear();
  }

  Future<void> removeProducts(int index) async {
    try {
      print(products[index].pid);
      print(products[index].category);
      await FirebaseFirestore.instance
          .collection('${products[index].category}')
          .doc('${products[index].pid}')
          .delete();
      products.removeAt(index);

      notifyListeners();
    } catch (e) {
      print('error while deleting ${e.toString()}');
    }
  }

  int getCatProductCount(String category) {
    int cnt = 0;
    for (int i = 0; i < products.length; i++) {
      if (products[i].category == category) cnt++;
    }
    return cnt;
  }

  Future<void> editProducts(int index, String picture, String name,
      String price, String category) async {
    products[index].name = name;
    products[index].price = price;
    products[index].picture = picture;
    products[index].category = category;

    await FirebaseFirestore.instance
        .collection('${products[index].category}')
        .doc(products[index].pid.toString())
        .update(
      {
        'pid': products[index].pid,
        'picture': products[index].picture,
        'name': products[index].name,
        'price': products[index].price,
        'category': products[index].category,
      },
    );
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
