part of 'cart_products_bloc.dart';

abstract class CartProductsEvent extends Equatable {
  const CartProductsEvent();

  @override
  List<Object> get props => [];
}

class FetchCartItemsEvent extends CartProductsEvent {}

class AddToCartEvent extends CartProductsEvent {
  final CartItemModel cartItem;
  const AddToCartEvent({required this.cartItem});
}
