import 'dart:convert';

class ItemModel {
  String id;
  String title;
  String picture;
  String unit;
  double price;
  String description;

  ItemModel({
    this.id = '',
    required this.title,
    required this.picture,
    required this.unit,
    required this.price,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'picture': picture,
      'unit': unit,
      'price': price,
      'description': description,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      picture: map['picture'] ?? '',
      unit: map['unit'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemModel.fromJson(String source) =>
      ItemModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ItemModel(id: $id, title: $title, picture: $picture, unit: $unit, price: $price, description: $description,)';
  }
}
