import 'package:flutter/material.dart';
import 'package:fresh_fruits/constants/color_constants.dart';

import '../../../../constants/text_constants.dart';
import '../../../../constants/text_styles.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: ColorConstants.whiteColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorConstants.orangeColor,
                ),
                Expanded(
                  child: Container(
                    color: ColorConstants.orangeColor,
                    height: 2,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: ColorConstants.lightGreyColor,
                    height: 2,
                  ),
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: ColorConstants.orangeColor,
                  child: CircleAvatar(
                      radius: 15, backgroundColor: ColorConstants.whiteColor),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  TextConstants.shippingAddressText,
                  style: TextStyles.shippingAddresswithOrangeColor,
                ),
                Text(
                  TextConstants.paymentMethodText,
                  style: TextStyles.paymentMethodStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
