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

  String productName(int index) {
    return products[index].name;
  }

  int productQuantity(int index) {
    return products[index].quantity;
  }

  String productPrice(int index) {
    return products[index].totalPrice;
  }
}
