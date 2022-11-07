import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/constants/button_styles.dart';
import 'package:fresh_fruits/constants/text_constants.dart';
import 'package:fresh_fruits/constants/text_styles.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/cart_item_model.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/shopping_cart_screen.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/bottom_navbar.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/custom_avtars.dart';
import '../../../../constants/color_constants.dart';
import '../blocs/cart_products/bloc/cart_products_bloc.dart';
import '../widgets/counter_widget.dart';

class ItemDetailsScreen extends StatelessWidget {
  final CartItemModel cartItem;
  const ItemDetailsScreen({super.key, required this.cartItem});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        body: Stack(
          children: [
            Positioned(
                child: Container(
              height: MediaQuery.of(context).size.height,
            )),
            Positioned(
                child: Image.asset(
              'assets/images/oranges.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            )),
            Positioned(
              top: MediaQuery.of(context).size.height / 3.5,
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: ColorConstants.appBackgroundcolor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TextConstants.fruitsText,
                        style: TextStyles.createAnAccountStyle,
                      ),
                      Text(
                        cartItem.fruit.name,
                        style: TextStyles.mainHeadingStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '\$${cartItem.fruit.price}',
                              style: TextStyles.priceTextStyle,
                            ),
                            const CounterWidget()
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorConstants.lightYellowColor,
                              size: 30,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 112.0),
                              child: RichText(
                                text: TextSpan(
                                    text: '4.5',
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: ColorConstants.blackColor,
                                        fontWeight: FontWeight.w500),
                                    children: [
                                      TextSpan(
                                        text: TextConstants.reviewsText,
                                        style: TextStyles.reviewsTextStyle,
                                      )
                                    ]),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: CustomAvatars(),
                            )
                          ],
                        ),
                      ),
                      TabBar(
                        labelStyle: TextStyles.tabLabelsStyle,
                        tabs: const [
                          Tab(
                            text: 'Description',
                          ),
                          Tab(
                            text: 'Review',
                          ),
                          Tab(
                            text: 'Discussions',
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 4,
                        child: TabBarView(children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: Text(
                              TextConstants.randomTabText,
                              style: TextStyles.tabBarTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: Text(
                              TextConstants.randomTabText,
                              style: TextStyles.tabBarTextStyle,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 32.0),
                            child: Text(
                              TextConstants.randomTabText,
                              style: TextStyles.tabBarTextStyle,
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_outlined,
                        color: ColorConstants.whiteColor,
                        size: 40,
                      )),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.share,
                        color: ColorConstants.whiteColor,
                        size: 40,
                      )),
                ],
              ),
            )
          ],
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          color: ColorConstants.whiteColor,
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  style: ButtonStyles.favButtonStyle,
                  onPressed: () {},
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  )),
              BlocBuilder<CartProductsBloc, CartProductsState>(
                builder: (context, state) {
                  
                  if (state is CartProductsInitial) {}
                  if (state is LoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is SuccessState) {
                    return ElevatedButton(
                        style: ButtonStyles.addToCartButtonStyle,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ShoppingCartScreen(),
                          ));
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'GO TO CART',
                              style: TextStyles.loginTextStyle,
                            ),
                            Text(
                              '\$${cartItem.fruit.price}',
                              style: TextStyles.loginTextStyle,
                            ),
                          ],
                        ));
                  }
                  return ElevatedButton(
                      style: ButtonStyles.addToCartButtonStyle,
                      onPressed: () {
                        BlocProvider.of<CartProductsBloc>(context)
                            .add(AddToCartEvent(cartItem: cartItem));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const ShoppingCartScreen(),
                        // ));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ADD TO CART',
                            style: TextStyles.loginTextStyle,
                          ),
                          Text(
                            '\$${cartItem.fruit.price}',
                            style: TextStyles.loginTextStyle,
                          ),
                        ],
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
