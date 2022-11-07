import 'package:dartz/dartz.dart';
import 'package:fresh_fruits/core/error/failure.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/cart_item_model.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/entities/cart_item.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/entities/fruit.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/cart_items_usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/fetch_fruits_usecase.dart';

abstract class FruitsRepository {
  Future<Either<Failure, List<Fruit>>> getFruits(NoParams params);
  Future<Either<Failure, List<CartItem>>> getCartItems(NoCartParams noCartParams);
  Future<Either<Failure,List<CartItem>>> addToCart(CartItemModel cartItemModel);
}
