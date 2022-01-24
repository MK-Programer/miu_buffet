import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:miu_food_court/models/order.dart';

class OrderProviders extends ChangeNotifier {
  final CollectionReference ordersCollection =
      FirebaseFirestore.instance.collection('Orders');
  List<Order> orders = <Order>[];
  List<Order> get getOrders {
    return orders;
  }

  load() async {
    orders.clear();
    QuerySnapshot querySnapshot = await ordersCollection.get();
    var result =
        querySnapshot.docs.map((doc) => {'data': doc.data(), 'id': doc.id});
    for (var element in result) {
      Order order = new Order.fromJson(element);
      orders.add(order);
      notifyListeners();
    }
  }
}
