class BurgerModel {
  late String id;
  late String imageUrl;
  late String name;
  late String description;
  late int price;
  late int rate;
  late String country;

  BurgerModel(this.id, this.imageUrl, this.name, this.description, this.price,
      this.rate, this.country);

  BurgerModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    imageUrl = map['img'];
    name = map['name'];
    description = map['dsc'];
    price = map['price'];
    rate = map['rate'];
    country = map['country'];
  }
}
