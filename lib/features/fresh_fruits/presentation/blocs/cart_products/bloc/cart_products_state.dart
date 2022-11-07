part of 'cart_products_bloc.dart';

abstract class CartProductsState extends Equatable {
  const CartProductsState();

  @override
  List<Object> get props => [];
}

class CartProductsInitial extends CartProductsState {}

class LoadingState extends CartProductsState {}

class SuccessState extends CartProductsState {
  final List<CartItem> items;
  const SuccessState({required this.items});
}

class ErrorState extends CartProductsState {
  final String message;
  const ErrorState({required this.message});
}
