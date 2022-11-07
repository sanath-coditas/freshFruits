import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/cart_item_model.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/entities/cart_item.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/add_to_cart_usecase.dart';
import 'package:fresh_fruits/features/fresh_fruits/domain/usecases/cart_items_usecase.dart';

part 'cart_products_event.dart';
part 'cart_products_state.dart';

class CartProductsBloc extends Bloc<CartProductsEvent, CartProductsState> {
  final CartItemsUsecase cartItemsUsecase;
  final AddToCartUseCase addToCartUseCase;
  CartProductsBloc(
      {required this.cartItemsUsecase, required this.addToCartUseCase})
      : super(CartProductsInitial()) {
    on<FetchCartItemsEvent>((event, emit) async {
      emit(LoadingState());
      final status = await cartItemsUsecase(NoCartParams());
      status.fold((l) => emit(ErrorState(message: l.message)),
          (r) => emit(SuccessState(items: r)));
    });
    on<CartProductsEvent>((event, emit) => emit(CartProductsInitial()));
    on<AddToCartEvent>((event, emit) async {
      emit(LoadingState());
      final addedStatus =
          await addToCartUseCase(CartItemParams(cartItemModel: event.cartItem));
      addedStatus.fold((l) => emit(ErrorState(message: l.message)),
          (r) => emit(SuccessState(items: r)));
    });
  }
}
