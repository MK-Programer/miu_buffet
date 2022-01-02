import 'package:flutter/foundation.dart';
import 'package:miu_food_court/models/cart.dart';

class CartProviders extends ChangeNotifier {
  List<Cart> products = <Cart>[];
  List<Cart> get getProduct {
    return products;
  }

  void addProducts(String picture, String name, String sugar, int strength,
      int quantity, String price) {
    Cart product = new Cart(picture, name, sugar, strength, quantity, price);
    products.add(product);
    notifyListeners();
  }

  void removeProducts(int index) {
    products.removeAt(index);
    notifyListeners();
  }

  void editProducts(
      int index, int quantity, String price, String sugar, int strength) {
    products[index].price = price;
    products[index].quantity = quantity;
    products[index].sugar = sugar;
    products[index].strength = strength;
    notifyListeners();
  }

  String productName(int index) {
    return products[index].name;
  }

  int productQuantity(int index) {
    return products[index].quantity;
  }

  String productPrice(int index) {
    return products[index].price;
  }

  String sugarCount(int index) {
    return products[index].sugar;
  }

  int strength(int index) {
    return products[index].strength;
  }
}
