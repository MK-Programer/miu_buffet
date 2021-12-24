import 'package:flutter/foundation.dart';
import 'package:miu_food_court/models/product.dart';

class ProductProviders extends ChangeNotifier {
  List<Product> products = <Product>[];
  List<Product> get getProduct {
    return products;
  }

  void addProducts(String name, String price) {
    Product product = new Product(name, price);
    products.add(product);
    notifyListeners();
  }

  void removeProducts(int index) {
    products.removeAt(index);
    notifyListeners();
  }

  void editProducts(int index, String name, price) {
    products[index].name = name;
    products[index].price = price;
    notifyListeners();
  }

  String productName(int index) {
    return products[index].name;
  }

  String productPrice(int index) {
    return products[index].price;
  }
}
