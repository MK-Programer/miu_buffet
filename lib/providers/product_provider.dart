import 'package:flutter/foundation.dart';
import 'package:miu_food_court/models/product.dart';

class ProductProviders extends ChangeNotifier {
  List<Product> products = <Product>[];
  List<Product> get getProduct {
    return products;
  }

  void addProducts(String picture, String name, String price, String category) {
    Product product = new Product(picture, name, price, category);
    products.add(product);
    notifyListeners();
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
