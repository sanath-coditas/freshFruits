import 'package:fresh_fruits/features/fresh_fruits/data/models/fruit_model.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/entities/cart_item.dart';

class CartItemModel extends CartItem {
  const CartItemModel(
  {required super.fruit}
  );

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      fruit: FruitModel.fromJson(json)
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'fruit' : (fruit as FruitModel).toJson()
    };
    return data;
  }
}
