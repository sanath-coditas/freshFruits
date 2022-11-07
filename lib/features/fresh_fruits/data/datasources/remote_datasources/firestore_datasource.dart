import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fresh_fruits/core/error/failure.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/cart_item_model.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/fruit_model.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/entities/cart_item.dart';

abstract class FireStoreDataSource {
  Future<Either<Failure, List<FruitModel>>> getFruits();
  Future<Either<Failure, List<CartItem>>> getCartItems();
  Future<Either<Failure, List<CartItemModel>>> addToCart(
      CartItemModel cartItemModel);
}

class FireStoreDataSourceImplementation implements FireStoreDataSource {
  @override
  Future<Either<Failure, List<FruitModel>>> getFruits() async {
    List<FruitModel> fruits = [];
    try {
      await FirebaseFirestore.instance
          .collection('fruits')
          .get()
          .then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          fruits.add(FruitModel.fromJson(element.data()));
        }
      });
      return Right(fruits);
    } on FruitsFetchFailure {
      return Left(FruitsFetchFailure(errorMsg: 'Unable to fetch...'));
    }
  }

  @override
  Future<Either<Failure, List<CartItemModel>>> getCartItems() async {
    List<CartItemModel> fruits = [];
    try {
      await FirebaseFirestore.instance
          .collection('cartItems')
          .doc(FirebaseAuth.instance.currentUser!.displayName!)
          .collection("Products")
          .get()
          .then((querySnapshot) {
        for (var element in querySnapshot.docs) {
          // print(element.data());
          fruits.add(CartItemModel.fromJson(element.data()['fruit']));
        }
      });

      return Right(fruits);
    } on FruitsFetchFailure {
      return Left(FruitsFetchFailure(errorMsg: 'Unable to fetch...'));
    }
  }

  @override
  Future<Either<Failure, List<CartItemModel>>> addToCart(
      CartItemModel cartItemModel) async {
    List<CartItemModel> cartItems = [];
    try {
      await FirebaseFirestore.instance
          .collection('cartItems')
          .doc(FirebaseAuth.instance.currentUser!.displayName!)
          .collection("Products")
          .add(cartItemModel.toJson());

      final status = await getCartItems();
      status.fold((l) {
        return Left(FruitsFetchFailure(errorMsg: 'Failed to fetch..'));
      }, (r) {
        cartItems = r;
      });
      return Right(cartItems);
    } on AddToCartFailure {
      return Left(AddToCartFailure(errorMsg: 'Failed to add..'));
    }
  }
}
