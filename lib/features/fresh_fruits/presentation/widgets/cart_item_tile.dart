import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:fresh_fruits/constants/text_styles.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/counter_widget.dart';

class CartItemTile extends StatelessWidget {
  final String imageLink;
  final String name;
  final num price;
  const CartItemTile(
      {super.key,
      required this.imageLink,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        background: Container(
          height: MediaQuery.of(context).size.height / 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: ColorConstants.blackColor),
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete,
                color: ColorConstants.whiteColor,
                size: 30,
              ),
            ),
          ),
        ),
        direction: DismissDirection.endToStart,
        key: GlobalKey(),
        child: Container(
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: ColorConstants.whiteColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 4.5,
                          height: MediaQuery.of(context).size.height / 7,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              image: DecorationImage(
                                  image: NetworkImage(imageLink),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 4.5,
                          height: MediaQuery.of(context).size.height / 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: ColorConstants.appTheme,
                          ),
                          child: Center(
                            child: Text(
                              '\$$price',
                              style: TextStyles.itemPriceSTyle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'FRUITS',
                        style: TextStyles.fruitsStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0, left: 8),
                      child: Text(
                        name,
                        style: TextStyles.itemPriceSTyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '\$28.8',
                        style: TextStyles.cartpriceTextStyle,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(bottom: 18.0),
                      child: CounterWidget(),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
