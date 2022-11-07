import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fresh_fruits/features/fresh_fruits/presentation/screens/write_review_screen.dart';

import '../../../../constants/color_constants.dart';
import '../../../../constants/text_constants.dart';
import '../../../../constants/text_styles.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.appBackgroundcolor,
        elevation: 0,
        title: Text(
          TextConstants.orderTrackingText,
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
            padding: const EdgeInsets.only(top: 2.0),
            child: Image.asset('assets/images/orderTrackImage.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
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
                  builder: (context) => const WriteReviewScreen(),
                ));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                child: Text(TextConstants.submitReviewText,
                    style: TextStyles.poppinsW600S20),
              ),
            ),
          )
        ],
      )),
    );
  }
}
