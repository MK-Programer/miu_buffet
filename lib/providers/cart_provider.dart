import 'package:flutter/foundation.dart';
import 'package:miu_food_court/models/cart.dart';

class CartProviders extends ChangeNotifier {
  List<Cart> products = <Cart>[];
  List<Cart> get getProduct {
    return products;
  }

  void addProducts(String picture, String name, String sugar, int quantity,
      String price, String totalPrice) {
    Cart product = new Cart(picture, name, sugar, quantity, price, totalPrice);
    products.add(product);
    notifyListeners();
  }

  void removeProducts(int index) {
    products.removeAt(index);
    notifyListeners();
  }

  void editProducts(int index, int quantity, String price, String sugar) {
    products[index].totalPrice = price;
    products[index].quantity = quantity;
    products[index].sugar = sugar;
    notifyListeners();
  }

  double totalCartPrice() {
    double totalPrice = 0.0;
    try {
      for (int i = 0; i < getProduct.length; i++) {
        totalPrice += double.parse(getProduct[i].totalPrice);
      }
    } on FormatException {
      print('Format error from string to double');
    }
    return totalPrice;
  }

  String productName(int index) {
    return products[index].name;
  }

  int productQuantity(int index) {
    return products[index].quantity;
  }

  String productPrice(int index) {
    return products[index].totalPrice;
  }

  String sugarCount(int index) {
    return products[index].sugar;
  }
}