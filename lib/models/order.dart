class Order {
  String uid;
  int pid;
  String picture;
  String name;
  int quantity;
  String totalPrice;

  Order(this.uid, this.pid, this.picture, this.name, this.quantity,
      this.totalPrice);

  factory Order.fromJson(Map json) {
    return Order(
      json['data']['uid'],
      int.parse(json['data']['pid']),
      json['data']['picture'] ?? '',
      json['data']['name'] ?? '',
      json['data']['quantity'],
      json['data']['price'] ?? '',
    );
  }
}
