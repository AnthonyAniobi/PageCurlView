import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  late String id;
  late String imageUrl;
  late String name;
  late String description;
  late String price;
  late int rate;
  late String country;

  // objects for cart
  int quantity = 1;

  ProductModel(this.id, this.imageUrl, this.name, this.description, this.price,
      this.rate, this.country);

  ProductModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    imageUrl = map['img'] ?? '';
    name = map['name'] ?? '';
    description = map['dsc'] ?? '';
    price = map['price'].toString() ?? '';
    rate = map['rate'] ?? 0;
    country = map['country'] ?? '';
  }

  @override
  List<Object?> get props =>
      [id, imageUrl, name, description, price, rate, country];
}
