import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_fruits/constants/color_constants.dart';
import 'package:fresh_fruits/constants/text_constants.dart';
import 'package:fresh_fruits/constants/text_styles.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/payment_method_screen.dart';
import '../../../../constants/button_styles.dart';
import '../widgets/form_body.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        title: Text(TextConstants.checkoutTitle),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 10, bottom: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/images/arrow.svg',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: ColorConstants.lightGreyContainerColor,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: ColorConstants.orangeColor,
                        child: CircleAvatar(
                            radius: 15,
                            backgroundColor: ColorConstants.whiteColor),
                      ),
                      Expanded(
                        child: Container(
                          color: ColorConstants.lightGreyColor,
                          height: 2,
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: ColorConstants.lightGreyColor,
                      )
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
                        style: TextStyles.shippingAddress,
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
          ),
          const FormBody(),
          Padding(
            padding: const EdgeInsets.only(
              left: 40.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                        color: ColorConstants.activeDotColor, width: 2),
                    color: ColorConstants.whiteColor,
                  ),
                  child: Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: ColorConstants.activeDotColor,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    TextConstants.saveShippingAddress,
                    style: TextStyles.subHeadingStyle,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              style: ButtonStyles.nextButtonStyle,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PaymentMethodScreen(),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  TextConstants.nextText,
                  style: TextStyles.createAnAccountStyle,
                ),
              ),
            ),
          ),
          
        ]),
      ),
    );
  }
}
