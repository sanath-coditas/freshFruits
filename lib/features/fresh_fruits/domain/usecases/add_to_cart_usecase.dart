import 'package:fresh_fruits/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fresh_fruits/core/usecase/usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/cart_item_model.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/entities/cart_item.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/repositories/fruits_repository.dart';

class AddToCartUseCase implements Usecase<List<CartItem>, CartItemParams> {
  final FruitsRepository fruitsRepository;
  const AddToCartUseCase({required this.fruitsRepository});
  @override
  Future<Either<Failure, List<CartItem>>> call(CartItemParams params) async {
    return await fruitsRepository.addToCart(params.cartItemModel);
  }
}

class CartItemParams {
  final CartItemModel cartItemModel;
  const CartItemParams({required this.cartItemModel});
}
