import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:fresh_fruits/constants/text_constants.dart';
import 'package:fresh_fruits/constants/text_styles.dart';
import 'package:fresh_fruits/features/fresh_fruits/data/models/cart_item_model.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/item_details_screen.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/bottom_navbar.dart';
import '../blocs/fruits_bloc/bloc/fruits_bloc_bloc.dart';

class DealsScreen extends StatelessWidget {
  const DealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: ColorConstants.appTheme,
                  child: AppBar(
                    bottom: PreferredSize(
                      preferredSize: Size.zero,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 1.34,
                            right: 184),
                        child: Text(
                          TextConstants.fruitsCategory,
                          style: TextStyles.fruitsCategoryTextStyle,
                        ),
                      ),
                    ),
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_outlined),
                        color: ColorConstants.whiteColor,
                        iconSize: 40,
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.format_align_left_outlined,
                              size: 30,
                              color: ColorConstants.whiteColor,
                            )),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3.4,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: ColorConstants.whiteColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 16.0, top: 20),
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: ColorConstants.inactiveDotColor,
                                  hintText: 'Search here',
                                  suffixIcon: Icon(
                                    Icons.search,
                                    size: 30,
                                    color: ColorConstants.greyCOlor,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 0),
                                      borderRadius: BorderRadius.circular(20)),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 0),
                                      borderRadius: BorderRadius.circular(20))),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.5,
                            child: BlocBuilder<FruitsBlocBloc, FruitsBlocState>(
                              builder: (context, state) {
                                if (state is FruitsBlocInitial) {
                                  BlocProvider.of<FruitsBlocBloc>(context)
                                      .add(FetchFruitsEvent());
                                } else if (state is LoadingState) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (state is SuccessState) {
                                  return GridView.builder(
                                    // physics: const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 0.7,
                                    ),
                                    itemCount: state.fruits.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 6),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ItemDetailsScreen(
                                                          cartItem:
                                                              CartItemModel(
                                                            fruit: state
                                                                .fruits[index],
                                                          ),
                                                        )));
                                          },
                                          child: Stack(
                                            fit: StackFit.loose,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: ColorConstants
                                                      .inactiveDotColor,
                                                  borderRadius:
                                                      BorderRadius.circular(32),
                                                  border: Border.all(
                                                      color: ColorConstants
                                                          .blackColor,
                                                      width: 0.2),
                                                  image: DecorationImage(
                                                    image: NetworkImage(state
                                                        .fruits[index].image),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 15,
                                                top: 10,
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: state.fruits[index]
                                                          .isFavourite
                                                      ? ColorConstants
                                                          .orangeColor
                                                      : ColorConstants
                                                          .whiteColor,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else if (state is ErrorState) {
                                  return AlertDialog(
                                    content: Text(state.message),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            BlocProvider.of<FruitsBlocBloc>(
                                                    context)
                                                .add(FetchFruitsEvent());
                                          },
                                          child: const Text('Retry'))
                                    ],
                                  );
                                }
                                return Container();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: BottomNavBar(),
            )
          ],
        ),
      ),
    );
  }
}
