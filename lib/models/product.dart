class Product {
  int pid;
  String picture;
  String name;
  String price;
  String category;
  Product(this.pid, this.picture, this.name, this.price, this.category);

  factory Product.fromJson(Map json) {
    return Product(
      int.parse(json['data']['pid']),
      json['data']['picture'] ?? '',
      json['data']['name'] ?? '',
      json['data']['price'] ?? '',
      json['data']['category'] ?? '',
    );
  }
}
