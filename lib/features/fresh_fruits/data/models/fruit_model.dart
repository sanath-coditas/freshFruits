import 'package:fresh_fruits/features/fresh_fruits/domain/entities/fruit.dart';

class FruitModel extends Fruit {
  const FruitModel({
    required super.image,
    required super.isFavourite,
    required super.name,
    required super.price,
    required super.isAddedToCart,
  });

  factory FruitModel.fromJson(Map<String, dynamic> json) {
    return FruitModel(
      image: json['image'],
      isFavourite: json['isFavourite'],
      name: json['name'],
      price: json['price'],
      isAddedToCart: json['isAddedToCart'],
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'image': image,
      'isFavourite': isFavourite,
      'name': name,
      'price': price,
      'isAddedToCart': isAddedToCart,
    };
    return data;
  }
}
