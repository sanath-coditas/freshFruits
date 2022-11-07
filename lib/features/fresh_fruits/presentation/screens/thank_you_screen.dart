import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/order_tracking_screen.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_constants.dart';
import '../../../../constants/text_styles.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.appBackgroundcolor,
        elevation: 0,
        title: Text(
          TextConstants.thankyouText,
          style: TextStyles.poppinsW600S20,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: SvgPicture.asset('assets/images/crossIcon.svg')),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Image.asset('assets/images/screenImage3.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 30, right: 30),
            child: Text(
              TextConstants.yourOrderinProcess,
              style: TextStyles.mainHeadingStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60.0, right: 60, top: 25),
            child: Text(
              TextConstants.randomText,
              style: TextStyles.randomTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180.0),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(ColorConstants.appTheme),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const OrderTrackingScreen(),
                ));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                child: Text(TextConstants.trackOrderText,
                    style: TextStyles.poppinsW600S20),
              ),
            ),
          )
        ],
      )),
    );
  }
}
