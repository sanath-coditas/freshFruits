import 'package:equatable/equatable.dart';

class Fruit extends Equatable {
  final String name;
  final num price;
  final bool isFavourite;
  final String image;
  final bool isAddedToCart;
  const Fruit({
    required this.image,
    required this.isFavourite,
    required this.name,
    required this.price,
    required this.isAddedToCart,
  });

  @override
  List<Object?> get props => [name, price, isFavourite, image];
}
