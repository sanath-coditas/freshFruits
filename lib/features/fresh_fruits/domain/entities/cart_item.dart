import 'package:equatable/equatable.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/entities/fruit.dart';

class CartItem extends Equatable {
  final Fruit fruit;
  const CartItem({required this.fruit});

  @override
  List<Object?> get props => [fruit];
}
