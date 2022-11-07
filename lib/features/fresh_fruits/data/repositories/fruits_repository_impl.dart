import 'package:fresh_fruits/features/fresh_fruits/data/datasources/remote_datasources/firestore_datasource.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/cart_item_model.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/fruit_model.dart';
import 'package:fresh_fruits/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/entities/cart_item.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/repositories/fruits_repository.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/cart_items_usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/fetch_fruits_usecase.dart';

class FruitsRepositoryImpl implements FruitsRepository {
  final FireStoreDataSource fireStoreDataSource;
  const FruitsRepositoryImpl({required this.fireStoreDataSource});
  

  @override
  Future<Either<Failure, List<FruitModel>>> getFruits(NoParams noParams) async {
    return await fireStoreDataSource.getFruits();
  }

  @override
  Future<Either<Failure, List<CartItem>>> getCartItems(
      NoCartParams noCartParams) async {
    return await fireStoreDataSource.getCartItems();
  }

  @override
  Future<Either<Failure, List<CartItemModel>>> addToCart(CartItemModel cartItemModel) async {
    return await fireStoreDataSource.addToCart(cartItemModel);
  }
}
