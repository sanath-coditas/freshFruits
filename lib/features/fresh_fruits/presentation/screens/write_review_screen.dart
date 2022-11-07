import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants/color_constants.dart';
import '../../../../constants/text_constants.dart';
import '../../../../constants/text_styles.dart';

class WriteReviewScreen extends StatelessWidget {
  const WriteReviewScreen({super.key});

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
            padding: const EdgeInsets.only(
                left: 16.0, right: 60, top: 40, bottom: 10),
            child: Text(
              TextConstants.tellUstoImprove,
              style: TextStyles.poppinsW600S20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              TextConstants.randomText,
              textAlign: TextAlign.center,
              style: TextStyles.poppinsW400S14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              '5.0',
              style: TextStyles.poppinsW600S50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset('assets/images/star.svg'),
                SvgPicture.asset('assets/images/star.svg'),
                SvgPicture.asset('assets/images/star.svg'),
                SvgPicture.asset('assets/images/star.svg'),
                SvgPicture.asset('assets/images/star.svg'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                TextConstants.letUsknowText,
                style: TextStyles.poppinsW500S14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              maxLines: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18))),
            ),
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
              onPressed: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 150, vertical: 20),
                child: Text(TextConstants.doneText,
                    style: TextStyles.poppinsW600S20),
              ),
            ),
          )
        ],
      )),
    );
  }
}
