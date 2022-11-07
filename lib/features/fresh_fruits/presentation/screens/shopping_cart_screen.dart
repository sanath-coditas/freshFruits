import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:fresh_fruits/constants/text_constants.dart';
import 'package:fresh_fruits/constants/text_styles.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/checkout_screen.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/bottom_navbar.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/cart_item_tile.dart';
import '../blocs/cart_products/bloc/cart_products_bloc.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: ColorConstants.whiteColor,
        toolbarHeight: MediaQuery.of(context).size.height / 10,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0, left: 30),
          child: Text(TextConstants.itemDetailsText),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CheckoutScreen(),
                ));
              },
              child: RichText(
                text: TextSpan(
                  text: TextConstants.placeOrderText,
                  style: TextStyles.placeOrderStyle,
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: BlocBuilder<CartProductsBloc, CartProductsState>(
        builder: (context, state) {
          if (state is CartProductsInitial) {
            BlocProvider.of<CartProductsBloc>(context)
                .add(FetchCartItemsEvent());
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is SuccessState) {
            return ListView.builder(
              itemExtent: 200,
              itemBuilder: (context, index) => CartItemTile(
                imageLink: state.items[index].fruit.image,
                name: state.items[index].fruit.name,
                price: state.items[index].fruit.price,
              ),
              itemCount: state.items.length,
            );
          }
          if (state is ErrorState) {
            return AlertDialog(
              content: Text(state.message),
              actions: [
                TextButton(
                    onPressed: () {
                      BlocProvider.of<CartProductsBloc>(context)
                          .add(FetchCartItemsEvent());
                    },
                    child: const Text('RETRY'))
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
