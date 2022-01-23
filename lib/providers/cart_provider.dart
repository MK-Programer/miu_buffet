import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:miu_food_court/models/cart.dart';
import 'package:miu_food_court/models/order.dart';

class CartProviders extends ChangeNotifier {
  int pid = 0;
  final CollectionReference orderHistoryCollection =
      FirebaseFirestore.instance.collection('Orders');
  List<Cart> products = <Cart>[];
  List<Order> order = [];
  List<Cart> get getProduct {
    return products;
  }

  List<Order> get getOrders {
    return order;
  }

  void addProducts(
      String uid,
      int pid,
      String picture,
      String name,
      String sugar,
      int quantity,
      String price,
      String totalPrice,
      String category) {
    Cart product = new Cart(
        uid, pid, picture, name, sugar, quantity, price, totalPrice, category);
    products.add(product);
    notifyListeners();
  }

  Future<void> checkOut(String uid, String email) async {
    for (int i = 0; i < order.length; i++) {
      await FirebaseFirestore.instance
          .collection('Orders')
          .doc(uid + pid.toString())
          .set(
        {
          'uid': email.toString(),
          'pid': order[i].pid.toString(),
          'picture': order[i].picture,
          'name': order[i].name,
          'quantity': order[i].quantity,
          'price': order[i].totalPrice,
        },
      );
      pid++;
    }
    order.clear();
    notifyListeners();
  }

  Future<void> loadHistory(String uid) async {
    order.clear();
    notifyListeners();
    QuerySnapshot querySnapshot = await orderHistoryCollection.get();
    var result = querySnapshot.docs
        .map((doc) => {'data': doc.data(), 'id': doc.id.contains(uid)});
    for (var element in result) {
      Order orders = new Order.fromJson(element);
      order.add(orders);
      notifyListeners();
    }
  }

  void clearList() {
    products.clear();
    notifyListeners();
  }

  void getOrder() {
    for (int i = 0; i < products.length; i++) {
      Order orders = new Order(
          products[i].uid,
          products[i].pid,
          products[i].picture,
          products[i].name,
          products[i].quantity,
          products[i].totalPrice);
      order.add(orders);
      notifyListeners();
    }
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
        totalPrice += double.parse(getProduct[i].totalPrice.toString());
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
