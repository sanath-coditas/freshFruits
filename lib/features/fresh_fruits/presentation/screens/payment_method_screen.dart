import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/thank_you_screen.dart';

import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/indicator_widget.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/widgets/payment_details_form.dart';

import '../../../../constants/button_styles.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/text_constants.dart';
import '../../../../constants/text_styles.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  bool isCreditCard = true;
  final _controller = ScrollController();
  bool isCashonDelivery = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
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
          child: Column(
        children: [
          const IndicatorWidget(),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 10,
            child: ListView(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isCashonDelivery == false) {
                          isCashonDelivery = true;
                          isCreditCard = false;
                        }
                        _controller.animateTo(0,
                            curve: Curves.fastOutSlowIn,
                            duration: const Duration(milliseconds: 300));
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                            color: isCashonDelivery
                                ? ColorConstants.orangeColor
                                : ColorConstants.appTheme,
                            width: 2),
                        color: isCashonDelivery
                            ? ColorConstants.orangeColor
                            : ColorConstants.whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Center(
                          child: Text(
                            TextConstants.cashOnDeliveryText,
                            style: isCashonDelivery
                                ? TextStyles.formItemStyleWithWhite
                                : TextStyles.formItemStyle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isCreditCard) {
                        } else {
                          isCreditCard = true;
                          isCashonDelivery = false;
                        }
                        _controller.animateTo(60,
                            curve: Curves.fastOutSlowIn,
                            duration: const Duration(milliseconds: 300));
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: isCreditCard
                            ? ColorConstants.appTheme
                            : ColorConstants.whiteColor,
                        border: Border.all(
                            color: ColorConstants.appTheme, width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Center(
                          child: Text(
                            TextConstants.creditCardText,
                            style: isCreditCard
                                ? TextStyles.formItemStyle
                                : TextStyles.formItemStyleWithOrange,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border:
                          Border.all(color: ColorConstants.appTheme, width: 2),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Center(
                        child: Text(
                          TextConstants.creditCardText,
                          style: TextStyles.formItemStyle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Image.asset('assets/images/creditCard1.png'),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset('assets/images/creditCard2.png')
                ],
              ),
            ),
          ),
          const PaymentDetailsForm(),
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
                    'Save credit card details',
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
                  builder: (context) => const ThankYouScreen(),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Confirm Order',
                  style: TextStyles.createAnAccountStyle,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
