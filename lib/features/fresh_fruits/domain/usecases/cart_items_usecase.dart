import 'package:fresh_fruits/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fresh_fruits/core/usecase/usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/entities/cart_item.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/repositories/fruits_repository.dart';

class CartItemsUsecase implements Usecase<List<CartItem>, NoCartParams> {
  final FruitsRepository fruitsRepository;
  const CartItemsUsecase({required this.fruitsRepository});
  @override
  Future<Either<Failure, List<CartItem>>> call(
      NoCartParams noCartParams) async {
    return await fruitsRepository.getCartItems(noCartParams);
  }
}

class NoCartParams {}
