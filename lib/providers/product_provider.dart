import 'package:flutter/foundation.dart';
import 'package:miu_food_court/models/product.dart';

class ProductProviders extends ChangeNotifier {
  List<Product> products = <Product>[];
  List<Product> get getProduct {
    return products;
  }

  void addProducts(String picture, String name, String price) {
    Product product = new Product(picture, name, price);
    products.add(product);
    notifyListeners();
  }

  void removeProducts(int index) {
    products.removeAt(index);
    notifyListeners();
  }

  void editProducts(int index, String picture, String name, price) {
    products[index].name = name;
    products[index].price = price;
    products[index].picture = picture;
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
